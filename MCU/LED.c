#include <stm32f4xx.h>		//INCLUDE THE HEADER FILE FOR THIS MCU FAMILY
#include "lED.h"					


  void LED_init (void){
		
	RCC->AHB1ENR|=RCC_AHB1ENR_GPIOBEN; //Port C clock enabled
		
  //CONFIGURE PORT PIN FUNCTIONS
	GPIOB->MODER&=~(3u<<(2*0) & 3u<<(2*7) & 3u<<(2*14));		//clear pin functions on GPIOB
	GPIOB->MODER|=(1u<<(2*0) | 1u<<(2*7) | 1u<<(2*14));		//set new pin functions on GPIOB
	}
	

 void Toggle_green_led (void) //green onboard LED toggled on/off
 {
	 GPIOB->ODR^=(1u<<0);  
 }

 void Toggle_blue_led (void) //blue onboard LED toggled on/off
 {
	 GPIOB->ODR^=(1u<<7);
 }
  
 void Toggle_red_led (void)  //red onboard LED toggled on/off
 {
	 GPIOB->ODR^=(1u<<14);
 }
 






