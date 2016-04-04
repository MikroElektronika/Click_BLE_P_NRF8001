/*******************************************************************************
* Title                 :   Text to Speech HAL
* Filename              :   sys_init.c
* Author                :   MSV
* Origin Date           :   01/02/2016
* Notes                 :   None
*******************************************************************************/
/*************** MODULE REVISION LOG ******************************************
*
*    Date    Software Version    Initials       Description
*  01/02/16       1.0.0             MSV        Module Created.
*
*******************************************************************************/

/******************************************************************************
* Includes
*******************************************************************************/
#include "blep_hal.h"
#include <stdint.h>

/******************************************************************************
* Module Preprocessor Constants
*******************************************************************************/

/******************************************************************************
* Module Preprocessor Macros
*******************************************************************************/

/******************************************************************************
* Module Typedefs
*******************************************************************************/

/******************************************************************************
* Module Variable Definitions
*******************************************************************************/
#if defined( __MIKROC_PRO_FOR_ARM__ )   || \
    defined( __MIKROC_PRO_FOR_DSPIC__ )
static void ( *write_spi_p )( unsigned int data_out );
static unsigned int ( *read_spi_p )( unsigned int buffer );

#elif defined( __MIKROC_PRO_FOR_AVR__ )     || \
      defined( __MIKROC_PRO_FOR_PIC__ )     || \
      defined( __MIKROC_PRO_FOR_8051__ )
static void ( *write_spi_p )( unsigned char data_out );
static unsigned char ( *read_spi_p )( unsigned char dummy );

#elif defined( __MIKROC_PRO_FOR_PIC32__ )
static void ( *write_spi_p )( unsigned long data_out );
static unsigned long ( *read_spi_p )( unsigned long buffer );

#elif defined( __MIKROC_PRO_FOR_FT90x__ )
static void ( *write_spi_p )( unsigned char data_out );
static unsigned char ( *read_spi_p )( unsigned char dummy );
static void ( *write_bytes_spi_p )( unsigned char *data_out,
                                    unsigned int count );
static void ( *read_bytes_spi_p )( unsigned char *buffer,
                                   unsigned int count );
#endif

#if defined( __MIKROC_PRO_FOR_ARM__ )     || \
    defined( __MIKROC_PRO_FOR_AVR__ )     || \
    defined( __MIKROC_PRO_FOR_PIC__ )     || \
    defined( __MIKROC_PRO_FOR_PIC32__ )   || \
    defined( __MIKROC_PRO_FOR_DSPIC__ )   || \
    defined( __MIKROC_PRO_FOR_8051__ )    || \
    defined( __MIKROC_PRO_FOR_FT90x__ )

extern sfr sbit CS;
extern sfr sbit RDYN;
extern sfr sbit ACT;
extern sfr sbit RST;

#endif

/******************************************************************************
* Function Prototypes
*******************************************************************************/

/******************************************************************************
* Function Definitions
*******************************************************************************/

void blep_hal_init()
{
#if defined( __MIKROC_PRO_FOR_ARM__ )   || \
    defined( __MIKROC_PRO_FOR_AVR__ )   || \
    defined( __MIKROC_PRO_FOR_DSPIC__ ) || \
    defined( __MIKROC_PRO_FOR_PIC32__ ) || \
    defined( __MIKROC_PRO_FOR_8051__ )
    write_spi_p = SPI_Wr_Ptr;
    read_spi_p = SPI_Rd_Ptr;

#elif defined( __MIKROC_PRO_FOR_PIC__ )
    write_spi_p = SPI1_Write;
    read_spi_p = SPI1_Read;

#elif defined( __MIKROC_PRO_FOR_FT90x__ )
    write_spi_p = SPIM_Wr_Ptr;
    read_spi_p = SPIM_Rd_Ptr;
    write_bytes_spi_p = SPIM_WrBytes_Ptr;
    read_bytes_spi_p = SPIM_RdBytes_Ptr;
#endif

}

uint8_t blep_hal_transfer (uint8_t _payload)
{

    return read_spi_p(_payload);
}

void digitalWrite (uint8_t pin_num, uint8_t level)
{
  switch ( pin_num)
  {
    case REQN_PIN:
      CS = level;
      break;
      case RDYN_PIN:
      RDYN = level;
      break;
    case RESET_PIN:
      RST = level;
      break;
      case ACTIVE_PIN:
      ACT = level;
      break;
    }
}

uint8_t digitalRead(uint8_t pin_num)
{
  uint8_t temp;
  switch ( pin_num)
  {
    case REQN_PIN:
      temp = (uint8_t)CS;
      break;
      case RDYN_PIN:
      temp = (uint8_t)RDYN;
      break;
    case RESET_PIN:
      temp = (uint8_t)RST;
      break;
    case ACTIVE_PIN:
      temp = (uint8_t)ACT;
      break;
    }
   return temp;
}


/*************** END OF FUNCTIONS ***************************************************************************/
