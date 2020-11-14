#include <stm32f4xx.h>		//INCLUDE THE HEADER FILE FOR THIS MCU FAMILY


void init_USERbutton (void)
{
	RCC->AHB1ENR|=RCC_AHB1ENR_GPIOCEN;	 //Port C clock enabled
	GPIOC->MODER|= (0<<(13*2));	//set pin function on GPIOC PC13 to input
	GPIOC->OTYPER|= (0<<(13*2)); //set pin as type push pull
  GPIOC->PUPDR|= (1u<<(13*2)); //set pin with pull up resistor
} 


	

	

