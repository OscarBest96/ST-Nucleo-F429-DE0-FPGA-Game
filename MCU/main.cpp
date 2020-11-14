#include "mbed.h"
#include "SWITCH.h"
#include "SWITCH.c"
#include "usart.h"
#include "usart.c"
#include "DAC.h"
#include "DAC.c"
#include "ADC.h"
#include "ADC.c"
#include "LCD.h"
#include "LCD.c"
#include "LED.h"
#include "LED.c"
#include "DELAY.h"
#include "DELAY.c"
#include <stm32f4xx.h>
#include "PLL_Config.c"

SPI spi(PA_7, PA_6, PA_5);      //initialise spi pin ports
DigitalOut cs(PC_6);            
DigitalIn DO_NOT_USE(PB_12);  

 int x =48; //variables x,y,z with intial value '0' used in POINTS function
 int y =48; //variables a,b,c with intial value '0' used in HIGH SCORE function
 int z =48; //never changes value, always a '0'
 int a =48;
 int b =48;
 int c =48; //never changes value, always a '0'
 int LEVEL = 48; //set variable to '0'
 int LED; // declare variable LED
 uint16_t spi_readwrite(uint16_t data);  //declare spi read/write function
 void Main_sequence();                   //declare main sequence funtion
 void init_USERbutton();                 //initialise blu user button
 void init_USART();                      //initialise usart



int main() {
    cs = 1;                     // Chip must be deselected, Chip Select is active LOW
    spi.format(16,0);           // Setup the DATA frame SPI for 16 bit wide word, Clock Polarity 0 and Clock Phase 0 (0)
    spi.frequency(1000000);     // 1MHz clock rate
	  PLL_Config();
	  SystemCoreClockUpdate();
    LED_init();                //CONFIGURE PORT PIN FUNCTIONS for LEDs
	  initLCD();                 //LCD initialised 
	  init_DAC();                //DAC initialised 
    init_ADC();                //ADC initialised 
	  Timer2();                  //Timer2 set to trigger interrupt every 100ms

	  

 Main_sequence (); //This is the very first FPGA LED sequence function (slowest). The game starts here...

	
}


 /*  uint16_t spi_readwrite(uint16_t data):
     Function for writing to the SPI with the correct timing
     data - this parameter is the data to be sent from the MCU to the FPGA over the SPI interface (via MOSI)
     return data - the data returned from the FPGA to the MCU over the SPI interface (via MISO)   */

uint16_t spi_readwrite(uint16_t data) 
{	
  cs = 0;             									          //Select the device by seting chip select LOW
	uint16_t rx = (uint16_t)spi.write(data);				//Send the data - ignore the return data
	wait_us(1);												            	//wait for last clock cycle to clear
	cs = 1;             								          	//De-Select the device by seting chip select HIGH
	return rx;
}

void Wrong_LED (void)
{
 LCD_CLR();     //clears LCD display
 GAME_OVER();   //displays GAME OVER on top line of LCD
 wait(1.5);     // 1.5 second delay
 LCD_CLR();     //clears LCD display
 if(x>a){a=x;}  //updates variable a and b ONLY if corresponding x and y are of higher value
 if(y>b){b=y;}
 POINT_total(x,y,z);     //display points on first line of LCD
 cmdLCD(LCD_LINE2); //ready LCD line 2 for writing
 HIGH_SCORE(a,b,c); //display the high score on the bottom line
 wait(1.5);         // 1.5 second delay
 LCD_CLR();         // clear the LCD display
 x =48;             //reset variables x and y ready for game to start again (z is unchanged).
 y =48;
 LEVEL=48;         //reset level
 Main_sequence (); //enter main sequence (start point)
}


void final_sequence (void) //Final sequence (fastest)
{
	LED=3;                 //target LED 3 for LCD display
	SPACE();               //ascii chars to position LED target on terminal
	Target_LED_3_usart();  //sends the target LED to the terminal 
	
  while(true)
	{
		
	 Toggle_green_led();            //green onboard LED toggled on/off
	 for (uint32_t i=1;i<=128;i*=2) //counts up from 1 to 128 in powers of 2 each representing LED 0-7
		{
			
		  spi_readwrite(i);        //send value of 'i' via spi to the fpga to light corresponding LED
		  output_dac(i);           //send value of 'i' to function which generates triangular DAC output
			POINTS_LEVEL_PROGRESSION_LINE_LED(x,y,z,LEVEL,i,LED);   //This function passes parameters x,y,z,LEVEL and i to display: progression line,
      wait_ms(25);             //delay of 25ms                  target LED, current level, current score.
			
			 if (((GPIOC->IDR & (1<<13)) !=0) && (i==8))   //if the blue user button is pressed on desired LED:
				 {
					 Toggle_blue_led();      //blue onboard LED is switched on
					 y++;                    //variable 'y' increments by 1
					 if (y>57)               //when y reaches 57 (ascii for decimal '9')
						  {
						   y=48;                 //y is reset to 48 (ascii for decimal '0')
						   x++;                  //x now increments by 1
					    }
					 wait(1.0);              //delay of 1 second
					 Toggle_blue_led();      //blue onboard LED is switched off
					 Main_sequence();        //enter Main sequence if push button is successful
				 }
					else if(((GPIOC->IDR & (1<<13)) !=0) && !(i==8))    //if the blue user button is NOT pressed on desired LED:
					{
						Wrong_LED();    //enter funtion which executes the wrong LED sequence
					}
					
					/* below code is a repeat of the above, but for the decending for loop */
					
		}
	 Toggle_green_led();           //green onboard LED toggled on/off
	 for (uint32_t i=64;i>=2;i/=2) //counts down from 64 to 2 in powers of 2 each representing LED 0-7
		{
		
		  spi_readwrite(i);        //send value of 'i' via spi to the fpga to light corresponding LED
		  output_dac(i);           //send value of 'i' to function which generates triangular DAC output
			POINTS_LEVEL_PROGRESSION_LINE_LED(x,y,z,LEVEL,i,LED);   //This function passes parameters x,y,z,LEVEL and i to display: progression line,
      wait_ms(25);             //delay of 25ms                  target LED, current level, current score.
			
			 if (((GPIOC->IDR & (1<<13)) !=0) && (i==8))   //if the blue user button is pressed on desired LED:
				 {
					 Toggle_blue_led();      //blue onboard LED is switched on
					 y++;                    //variable 'y' increments by 1
					 if (y>57)               //when y reaches 57 (ascii for decimal '9')
						  {
						   y=48;                 //y is reset to 48 (ascii for decimal '0')
						   x++;                  //x now increments by 1
					    }
					 wait(1.0);              //delay of 1 second
					 Toggle_blue_led();      //blue onboard LED is switched off
					 Main_sequence();        //enter Main sequence if push button is successful
				 }
					else if(((GPIOC->IDR & (1<<13)) !=0) && !(i==8))    //if the blue user button is NOT pressed on desired LED:
					{
						Wrong_LED();    //enter funtion which executes the wrong LED sequence
					}
		}

  }
}




void Second_sequence (void) //Middle sequence
{
	LED=2;                 //target LED 2 for LCD display
	SPACE();               //ascii chars to position LED target on terminal
  Target_LED_2_usart();  //sends the target LED to the terminal 
	 
  while(true)                 
  {      
	 Toggle_green_led();         //green onboard LED toggled on/off
	 for (uint32_t i=1;i<=128;i*=2) //counts up from 1 to 128 in powers of 2 each representing LED 0-7
		{
			
		  spi_readwrite(i);        //send value of 'i' via spi to the fpga to light corresponding LED
		  output_dac(i);           //send value of 'i' to function which generates triangular DAC output
			POINTS_LEVEL_PROGRESSION_LINE_LED(x,y,z,LEVEL,i,LED);   //This function passes parameters x,y,z,LEVEL and i to display: progression line,
      wait_ms(50);             //delay of 50ms                  target LED, current level, current score.
			
			 if (((GPIOC->IDR & (1<<13)) !=0) && (i==32))   //if the blue user button is pressed on desired LED:
				 {
					 Toggle_blue_led();      //blue onboard LED is switched on
					 y++;                    //variable 'y' increments by 1
					 if (y>57)               //when y reaches 57 (ascii for decimal '9')
						 {
						 y=48;                 //y is reset to 48 (ascii for decimal '0')
						 x++;                  //x now increments by 1
					   }
					 wait(1.0);              //delay of 1 second
					 Toggle_blue_led();      //blue onboard LED is switched off
					 final_sequence();       //enter final sequence if push button is successful
				 }
					else if(((GPIOC->IDR & (1<<13)) !=0) && !(i==32))    //if the blue user button is NOT pressed on desired LED:
					{
						Wrong_LED();    //enter funtion which executes the wrong LED sequence
					}
				
				/* below code is a repeat of the above, but for the decending for loop */	
					
		}
	 Toggle_green_led();           //green onboard LED toggled on/off
	 for (uint32_t i=64;i>=2;i/=2) //counts down from 64 to 2 in powers of 2 each representing LED 0-7
		{
			
		  spi_readwrite(i);        //send value of 'i' via spi to the fpga to light corresponding LED
		  output_dac(i);           //send value of 'i' to function which generates triangular DAC output
			POINTS_LEVEL_PROGRESSION_LINE_LED(x,y,z,LEVEL,i,LED);    //This function passes parameters x,y,z,LEVEL and i to display: progression line,
      wait_ms(50);             //delay of 50ms                   target LED, current level, current score.
			
			 if (((GPIOC->IDR & (1<<13)) !=0) && (i==32))   //if the blue user button is pressed on desired LED:
				 {
					 Toggle_blue_led();      //blue onboard LED is switched on
					 y++;                    //variable 'y' increments by 1
					 if (y>57)               //when y reaches 57 (ascii for decimal '9')
						 {
						 y=48;                 //y is reset to 48 (ascii for decimal '0')
						 x++;                  //x now increments by 1
					   }
					 wait(1.0);              //delay of 1 second
					 Toggle_blue_led();      //blue onboard LED is switched off
					 final_sequence();       //enter final sequence if push button is successful
				 }
					else if(((GPIOC->IDR & (1<<13)) !=0) && !(i==32))    //if the blue user button is NOT pressed on desired LED:
					{
						Wrong_LED();    //enter funtion which executes the wrong LED sequence
					}
		 }		
  }
}



void Main_sequence (void)  // slowest sequence
{
	LED=1;                //target LED 1 for LCD display
	LEVEL++;              // increase the level by 1
	SPACE();              //ascii chars to position LED target on terminal
  Target_LED_1_usart(); //sends the target LED to the terminal 

  while(true)                 
  {      
	 Toggle_green_led();              //green onboard LED toggled on/off
	  for (uint32_t i=1;i<=128;i*=2)  //counts up from 1 to 128 in powers of 2 each representing LED 0-7
		 {
			
      spi_readwrite(i);   //send value of 'i' via spi to the fpga to light corresponding LED
			output_dac(i);     //send value of 'i' to function which generates triangular DAC output
			POINTS_LEVEL_PROGRESSION_LINE_LED(x,y,z,LEVEL,i,LED);      //This function passes parameters x,y,z,LEVEL and i to display: progression line,
      wait_ms(75);      //delay of 75ms                           target LED, current level, current score.
			
			if (((GPIOC->IDR & (1<<13)) !=0) && (i==64)) //if the blue user button is pressed on desired LED:
				{
          Toggle_blue_led(); //blue onboard LED is switched on
					y++;               //variable 'y' increments by 1
					 if (y>57)         //when y reaches 57 (ascii for decimal '9')
						 {
						 y=48;          //y is reset to 48 (ascii for decimal '0')
						 x++;           //x now increments by 1
					   }
					wait(1.0);          //delay of 1 second
					Toggle_blue_led();  //blue onboard LED is switched off
					Second_sequence();  //enter second sequence if push button is successful
			  }
					else if(((GPIOC->IDR & (1<<13)) !=0) && !(i==64)) //if the blue user button is NOT pressed on desired LED:
					{
						Wrong_LED();    //enter funtion which executes the wrong LED sequence
					}
		}
		
		/* below code is a repeat of the above, but for the decending for loop */
		
		
		Toggle_green_led(); 
    for (uint32_t i=64;i>=2;i/=2) //counts down from 64 to 2 in powers of 2 each representing LED 0-7
			{                           //starts at 64 and ends at 2 as incrementing 'for loop' begins and ends on '1' and '128'
				                          //this avoids writing to the LEDs twice.
				
        spi_readwrite(i);   //send value of 'i' via spi to the fpga to light corresponding LED
				output_dac(i);      //send value of 'i' to function which generates triangular DAC output
				POINTS_LEVEL_PROGRESSION_LINE_LED(x,y,z,LEVEL,i,LED);   //This function passes parameters x,y,z,LEVEL and i to display: progression line,
        wait_ms(75);        //delay of 75ms                       target LED, current level, current score.
				    
				if (((GPIOC->IDR & (1<<13)) !=0)&& (i==64))    //if the blue user button is pressed on desired LED:
				{
          Toggle_blue_led(); //blue onboard LED is switched on
					y++;               //variable 'y' increments by 1
					 if (y>57)         //when y reaches 57 (ascii for decimal '9')
						 {
						  y=48;          //y is reset to 48 (ascii for decimal '0')
						  x++;           //x now increments by 1
					   }
				  wait(1.0);          //delay of 1 second
				  Toggle_blue_led();  //blue onboard LED is switched off
          Second_sequence();  //enter second sequence if push button is successful
				}
					else if(((GPIOC->IDR & (1<<13)) !=0) && !(i==64)) //if the blue user button is NOT pressed on desired LED:
					{
						Wrong_LED();    //enter funtion which executes the wrong LED sequence
					}
				
		  }
	 }
}

void TIM2_IRQHandler();  //interrupt routine to sample the ADC every 100ms and print the values to the terminal

 
 






