#include "blep_hal.h"
#include "nrf8001-ble-uart-spark-io.h"
#include <string.h>

#define SERIAL_BUFFER_LENGTH 32

sbit CS at GPIOD_ODR.B13;
sbit RST at GPIOC_ODR.B2;
sbit ACT at GPIOA_IDR.B4;
//sbit MISO at GPIOC_ODR.B11;
//sbit MOSI at GPIOD_ODR.B12;
sbit RDYN at GPIOD_IDR.B10;

static uint8_t serial_buffer[SERIAL_BUFFER_LENGTH];

/**
* A macro that checks for a name=xxxx command from the terminal.
*/
#define IS_NAME_SETTING(buf) (memcmp((void*) buf, (void*) "name=", 5) == 0)

/**
* Small helper function to erase the contents of the serial buffer
*/
static void clear_serial_buffer()
{            uint8_t i;
        for (i = 0; i < SERIAL_BUFFER_LENGTH; ++i)
        {
                serial_buffer[i] = ' ';
        }
}

/**
* Main Arduino compliant setup function
*/
void setup(void)
{
        // Initiate Serial communication
        // The USB serial on the Spark Core may take
        // a second to set up:
        Delay_ms(3000);
        // Do the BLE UART setup:
         nRF8001BleUartSetup(MOSI_PIN, MISO_PIN, SCK_PIN, REQN_PIN, RDYN_PIN, RESET_PIN);

        // Clear the serial buffer:
        clear_serial_buffer();

}

/**
* Implementation of RX callback function
* Handles any incoming data from the BLE UART
*
* Simply sends all messages directly to terminal
*/
void nRF8001BleUartRx(uint8_t *buffer, uint8_t len)
{
        uint8_t i;
        UART1_Write_Text("Received data: ");

        for (i = 0; i < len; ++i)
        {
                UART1_Write((char) buffer[i]);
        }
}

/**
* Function for polling USB serial. Make sure the terminal ends
* message with a newline ('\n')
*/
void handle_serial_input()
{
        static uint8_t msg_length = 0;
        char name_buf[100] = {0};

        // Poll Serial input:
        while (UART1_Data_Ready())
        {
                serial_buffer[msg_length++] = (uint8_t) UART1_Read();

                // If the end of the message is reached or the buffer full,
                // send the message
                if ('\n' == serial_buffer[msg_length - 1] ||
                                                        SERIAL_BUFFER_LENGTH == msg_length)
                {
                        // check if the input is the name=xxxx command.
                        if (IS_NAME_SETTING(serial_buffer))
                        {
                                //copy name into new, small buffer.
                                //char name_buf[msg_length-6];
                                memcpy(name_buf, &serial_buffer[5], msg_length - 6);
                                //name_buf[msg_length - 5] = "\0";
                                //set name
                                nRF8001BleUartNameSet(name_buf, msg_length - 6);
                        }
                        else
                        {
                                //input was not a name setting, send it over BLE UART.
                                nRF8001BleUartTx(serial_buffer, msg_length - 1);
                        }

                        // Prepare the buffer for the next message:
                        clear_serial_buffer();
                        msg_length = 0;
                }
        }
}


void main() {
  UART1_Init(57600);
  UART1_Write_Text("Uart initialized");
  UART1_Write(10);
  UART1_Write(13);
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_13);
  GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_4);
  GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10);
  GPIO_Digital_Output(&GPIOC_ODR, _GPIO_PINMASK_2);                             // Set PC2 (RST) as digital output
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0);                            // Set PA0 (CONN)


  SPI3_Init_Advanced(_SPI_FPCLK_DIV128,
                     _SPI_MASTER | _SPI_8_BIT | _SPI_CLK_IDLE_LOW |
                     _SPI_FIRST_CLK_EDGE_TRANSITION | _SPI_LSB_FIRST | _SPI_SS_DISABLE |
                      _SPI_SSM_ENABLE | _SPI_SSI_1,
                      &_GPIO_MODULE_SPI3_PC10_11_12);
   blep_hal_init();
   
   setup();
   //UART1_Write_Text("while loop");
  //UART1_Write(10);
  //UART1_Write(13);

   while(1)
   {
              // Run the BLE UART loop once in every loop,
        // to let it handle any BLE events
        nRF8001BleUartLoop();

        // handle all serial reads in one separate function:
        handle_serial_input();
   }
   
}