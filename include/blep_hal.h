                      /****************************************************************************
* Title                 :   CLICKNAME click
* Filename              :   CLICKNAME_hal.h
* Author                :   MSV
* Origin Date           :   28/01/2016
* Notes                 :   None
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*    Date    Software Version    Initials   Description
*  28/01/16    XXXXXXXXXXX         MSV      Interface Created.
*
*****************************************************************************/
/**
 * @file CLICKNAME_hal.h
 *  @brief What is does
 *
 *  @date 28 Jan 2016
 *  @author Milos Vidojevic
 *  @copyright GNU Public License
 *
 *  @version .1 - Initial testing and verification
 *
 *  @note Test configuration:
 *   MCU:             STM32F107VC
 *   Dev.Board:       EasyMx Pro v7
 *   Oscillator:      72 Mhz internal
 *   Ext. Modules:    GPS Click
 *   SW:              ARM 4.5.2
 *
 */
#ifndef CLICKNAME_HAL_H_
#define CLICKNAME_HAL_H_
/******************************************************************************
* Includes
*******************************************************************************/
#include "stdint.h"
/******************************************************************************
* Preprocessor Constants
*******************************************************************************/
#define READ                    1                // READ BIT
#define WRITE                   0                // WRITE BIT
#define COMMAND_SIZE            2                // COMMAND OR REGISTER SIZE ( Bytes )
#define MAX_BUFF_SIZE           256                // BUFFER SIZE ( Bytes )
/******************************************************************************
* Configuration Constants
*******************************************************************************/

/******************************************************************************
* Macros
*******************************************************************************/

/******************************************************************************
* Typedefs
*******************************************************************************/
typedef enum
{
   REQN_PIN = 0,
   RDYN_PIN,
   MOSI_PIN,
   MISO_PIN,
   SCK_PIN,
   RESET_PIN,
   ACTIVE_PIN,
   OPTIONAL_CS,
}pin_t;
/******************************************************************************
* Variables
*******************************************************************************/

/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C"{
#endif

void blep_hal_init();
uint8_t blep_hal_transfer (uint8_t _payload);
void digitalWrite(uint8_t pin, uint8_t mode);
uint8_t digitalRead(uint8_t pin_num);

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* CLICKNAME_HAL_H_ */

/*** End of File **************************************************************/