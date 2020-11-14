#include "DAC.h"

void init_DAC(void)
{
	RCC->AHB1ENR|=RCC_AHB1ENR_GPIOAEN;			//DAC port clock enable
	DAC_port->MODER|=(3u<<(2*DAC_pin));			//DAC output pin set as anaglogue
	
	RCC->APB1ENR|=RCC_APB1ENR_DACEN;				//DAC clock enable
	DAC->CR|=DAC_CR_EN1;										//DAC 2 enabled
}

void output_dac(unsigned short i) //This funtion uses switch case to divide the 12bit DAC range (4095) by 8
{                                 //parameter 'i' is passed from main matching fpga LED sequence rate
	switch (i)                      //utilises full range 1-4095 for triangular output
	{
	case 1:
		
	for (uint32_t d=1;i<=512;i++)  //for fpga LED 0 --> first 1/8th section count begins
	{
	DAC->DHR12R1=d;			//write data byte to DAC 2 output register
  }
	break; 
	
	case 2:
		
	for (uint32_t d=512;i<=1024;i++) //for fpga LED 1 --> second 1/8th section count begins
	{
	DAC->DHR12R1=d;			//write data byte to DAC 2 output register
	}
	break; 
	
	case 4:
		
	for (uint32_t d=1024;i<=1536;i++) //for fpga LED 2 --> third 1/8th section count begins
	{
	DAC->DHR12R1=d;			//write data byte to DAC 2 output register
	}
	break; 
	
	case 8:
		
	for (uint32_t d=1536;i<=2048;i++) //for fpga LED 3 --> fourth 1/8th section count begins
	{
	DAC->DHR12R1=d;			//write data byte to DAC 2 output register
	}
	break; 
	
	case 16:
		
	for (uint32_t d=2048;i<=2560;i++) //for fpga LED 4 --> fifth 1/8th section count begins
	{
	DAC->DHR12R1=d;			//write data byte to DAC 2 output register
	}
	break; 
	
	case 32:
		
	for (uint32_t d=2560;i<=3072;i++) //for fpga LED 5 --> sixth 1/8th section count begins
	{
	DAC->DHR12R1=d;			//write data byte to DAC 2 output register
	}		
	break; 
	
	case 64:
		
	for (uint32_t d=3072;i<=3584;i++) //for fpga LED 6 --> seventh 1/8th section count begins
	{
	DAC->DHR12R1=d;			//write data byte to DAC 2 output register
	}		
	break; 
	
	case 128:
		
	for (uint32_t d=3584;i<=4095;i++) //for fpga LED 7 --> eighth 1/8th section count begins
	{
	DAC->DHR12R1=d;			//write data byte to DAC 2 output register
	}
	break; 
 }
}

	
	
	
	
	
	
	
	



