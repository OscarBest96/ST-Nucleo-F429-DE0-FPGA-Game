#include "DELAY.h"
#include <stm32f4xx.h>		//INCLUDE THE HEADER FILE FOR THIS MCU FAMILY



 void Timer2 (void)  //Timer set up to trigger interrupt every 100ms
	{
	
	RCC->AHB1ENR|=RCC_AHB1ENR_GPIOBEN;		//GPIO B clock enable
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN;		//timer 2 clock enabled
	TIM2->DIER|=TIM_DIER_UIE;						//timer uptdate interrupt enabled
			                          //APB clock is Fcy/2 = 180MHz/2 = 90MHz
	TIM2->PSC=256-1;						//divide APB clock by 1875 = 90MHz/1875 = 48kHz
	TIM2->ARR=35156;				//counter reload value, gives a timer period of 100ms when F_APB = 90MHz and PSC = 1875
	TIM2->CNT=0;							//zero timer counter
	NVIC->ISER[0]|=(1u<<28);		//timer 2 global interrupt enabled
	TIM2->CR1|=TIM_CR1_CEN;		//start timer counter
	}
	
	
void TIM2_IRQHandler(void)  //ISR triggers every 100ms 
 {
	 TIM2->SR&=~TIM_SR_UIF;                          //clear interrupt flag
	 void Toggle_red_led();                          //declare LED.c function 'Toggle_red_led()'
	 void display_voltage(unsigned short ADC_DATA);  //declare usart.c function 'display_voltage(unsigned short ADC_DATA)'
	 unsigned short read_adc(void);                  //declare ADC.c function 'read_adc(void)'
	                                                 //allows them to be used in interrupt
	 Toggle_red_led();                               //toggle red onboard LED
	 unsigned short ADC_DATA = read_adc();           //read ADC and store data in variable 'ADC_DATA'
   display_voltage(ADC_DATA);                      //pass ADC_DATA as a parameter of funtion 'display_voltage'
 }
 


