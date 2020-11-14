#include "usart.h"
#include <stdlib.h>

void send_usart(unsigned char d)
{
	while(!(USART_MODULE->SR&USART_SR_TC));		//wait for transmission complete
	USART_MODULE->DR=d;		//write byte to usart data register
}

void Target_LED_1_usart (void) //This function uses ascii chars to print the first LED target to the terminal
{	
	send_usart(76); // 'L'
	send_usart(69); // 'E'
	send_usart(68); // 'D'
	send_usart(32); // 'SPACE'
	send_usart(54); // '6'
	send_usart(32); // 'SPACE'
	send_usart(60); // '<'
	send_usart(45); // '-'
	send_usart(45); // '-'
	send_usart(13); // 'CARRIAGE FEED'
	
}

void Target_LED_2_usart (void) //This function uses ascii chars to print the second LED target to the terminal
{	
	send_usart(76); // 'L'
	send_usart(69); // 'E'
	send_usart(68); // 'D'
	send_usart(32); // 'SPACE'
	send_usart(53); // '5'
	send_usart(32); // 'SPACE'
	send_usart(60); // '<'
	send_usart(45); // '-'
	send_usart(45); // '-'
	send_usart(13); // 'CARRIAGE FEED'
		
}

void Target_LED_3_usart (void) //This function uses ascii chars to print the third LED target to the terminal
{	
	send_usart(76); // 'L'
	send_usart(69); // 'E'
	send_usart(68); // 'D'
	send_usart(32); // 'SPACE'
	send_usart(52); // '4'
	send_usart(32); // 'SPACE'
	send_usart(60); // '<'
	send_usart(45); // '-'
	send_usart(45); // '-'
	send_usart(13); // 'CARRIAGE FEED'
}

 void display_voltage(unsigned short ADC_DATA)
 {
    short value;
		value=ADC_DATA;      //Variable 'value' = bit value read from DAC output.
		
		float Voltage;
		Voltage= value*(3.3f/4095);  //conversion of bit value to voltage value 'Voltage'
		
	  short first_value;        // variable setup for absolute value number conversion.
		float second_number;      // each 'number' = raw voltage read 
		short second_value;       // each 'value' = absolute value of the equivalant 'number' variable.
		float third_number;
	  short third_value;
		float fourth_number;
		short fourth_value;
		
	first_value =abs(Voltage);                   // 'first_value' = the absolute value of the first voltage read.
	second_number =(Voltage-first_value)*10;     // 'second_number' = the first voltage value read - it's absolute value.
	second_value =abs(second_number);             //              This float value*10, shifts the next 1dp number to the next integer.
	third_number =(second_number-second_value)*10; //             The next absolute value is taken and assigned to variable 'second_value'
	third_value =abs(third_number);                //             The process continues untill abs values for third & fourth are taken.
	fourth_number =(third_number-third_value)*10;
	fourth_value =abs(fourth_number);
		
		short Voltage_outputV1;  // Four new variables ready to assign absolute values 1-4.
		short Voltage_outputV2;
		short Voltage_outputV3;
		short Voltage_outputV4;
		
		Voltage_outputV1=(first_value+48); // Each absolute value +48 allows ascii translation ready to output to peripherals.
		Voltage_outputV2=(second_value+48);
		Voltage_outputV3=(third_value+48);
		Voltage_outputV4=(fourth_value+48);
		
		send_usart(13);                // Ascii code for 'LINE RESET' (decimal).
		send_usart(Voltage_outputV1);  // This outputs voltage samples to usart display on putty.
		send_usart(46);                // Ascii code for '.' (decimal).
		send_usart(Voltage_outputV2);
		send_usart(Voltage_outputV3);
		send_usart(Voltage_outputV4);
		send_usart(86);  
		send_usart(13);                // Ascii code for 'LINE RESET' (decimal).
	}
 
void SPACE (void) // This function is used to position the target LED on the terminal using ascii chars
{
	send_usart(13); //mainly consisting of spaces to position text further right of the screen
	send_usart(32); //as voltage updates and displays on the LHS
	send_usart(32);
	send_usart(32);
	send_usart(32);
	send_usart(32);
	send_usart(32);
	send_usart(32);
	send_usart(32);
	send_usart(32);
	send_usart(45); // '-'
	send_usart(45); // '-'  beginning of target LED display
	send_usart(62); // '>'  
	send_usart(32);
}

 
 
void init_USART(void)
{
	unsigned char i1,i2;
		RCC->AHB1ENR|=RCC_AHB1ENR_GPIODEN;		//usart port clock enable
	
	USART_PORT->MODER&=~(				//clear pin function bits
		(3u<<(2*USART_TX_pin))
		|(3u<<(2*USART_RX_pin))
			);
	USART_PORT->MODER|=(			//reset pin function bits (alternate function)
		(2u<<(2*USART_TX_pin))
		|(2u<<(2*USART_RX_pin))
			);
	
	i1=USART_TX_pin/8;
	i2=USART_RX_pin/8;

		// ALTERNATE FUNCTION SELECT BITS
	USART_PORT->AFR[i1]&=~(0x0f<<(4*(USART_TX_pin-(i1*8))));
	USART_PORT->AFR[i1]|=(0x07<<(4*(USART_TX_pin-(i1*8))));
	USART_PORT->AFR[i2]&=~(0x0f<<(4*(USART_RX_pin-(i2*8))));
	USART_PORT->AFR[i2]|=(0x07<<(4*(USART_RX_pin-(i2*8))));
	
	RCC->APB1ENR|=RCC_APB1ENR_USART3EN;		//usart clock enable
	USART_MODULE->CR1|=(		//USART CONFIG
			USART_CR1_TE		//transmit enable
			|USART_CR1_RE		//receive enable
			|USART_CR1_UE		//usart main enable bit
				);
	USART_MODULE->BRR=SystemCoreClock/(BAUDRATE);		//set baud rate
}

