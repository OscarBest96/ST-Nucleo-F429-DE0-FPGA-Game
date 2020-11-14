#include "lcd.h"

void lcd_delayus(unsigned int us)		//blocking delay for LCD, argument is approximate number of micro-seconds to delay
{
	unsigned char i;
	while(us--)
	{
		for(i=0; i<SystemCoreClock/4000000; i++);
	}
}


void BusyFlag(void)     //busyflag delay to check LCD isn't busy before sending data.
{
	set_LCD_bus_input();
	set_LCD_RW();
	clr_LCD_RS();
	clr_LCD_E();
	set_LCD_E();
	clr_LCD_E();
	
	unsigned int i=1;
	while(i!=0)
	{
			set_LCD_E();
	    i=GPIOD->IDR;
		  i&=(1u<<7);
		  clr_LCD_E();
}
	set_LCD_bus_output();
}
	
void GAME_OVER (void)  //displays GAME OVER message on LCD
{	
	cmdLCD(LCD_LINE1); //select first line of LCD
	putLCD(71); // 'G'
	putLCD(65); // 'A'
	putLCD(77); // 'M'
	putLCD(69); // 'E'
	putLCD(32); // 'SPACE'
	putLCD(79); // 'O'
	putLCD(86); // 'V'
	putLCD(69); // 'E'
	putLCD(82); // 'R'
}
void POINT_total(int x, int y, int z)
{
	putLCD(x); //displays decimal 0-9
	putLCD(y); //displays decimal 0-9
	putLCD(z); //remains at 48 (decimal 0 as score increments in tens)
}

void Target_LED_1_LCD (void) //This function uses ascii chars to print the first LED target to the LCD
{	
	cmdLCD(LCD_LINE2); // select line 2 of LCD
	putLCD(76); // 'L'
	putLCD(69); // 'E'
	putLCD(68); // 'D'
	putLCD(32); // 'SPACE'
	putLCD(54); // '6'
}

void Target_LED_2_LCD (void) //This function uses ascii chars to print the second LED target to the LCD
{	
	cmdLCD(LCD_LINE2); // select line 2 of LCD
	putLCD(76); // 'L'
	putLCD(69); // 'E'
	putLCD(68); // 'D'
	putLCD(32); // 'SPACE'
	putLCD(53); // '5'
}

void Target_LED_3_LCD (void) //This function uses ascii chars to print the third LED target to the LCD
{	
  cmdLCD(LCD_LINE2); // select line 2 of LCD
	putLCD(76); // 'L'
	putLCD(69); // 'E'
	putLCD(68); // 'D'
	putLCD(32); // 'SPACE'
	putLCD(52); // '4'
}

	
void POINTS_LEVEL_PROGRESSION_LINE_LED (int x, int y, int z, int LEVEL, int i, int LED) //This function is responsible for displaying: progression line, target LED,
{                                                                                       //current level, current score.                                                                         
	
	LCD_CLR();       //clear LCD display
	putLCD('-');     //print 1 line
  switch (i)       //switch case uses passed parameter 'i' to display progression line            
		
	{
	case 1:
	cmdLCD(LCD_LINE1); //ready top line
	putLCD('-');       //print 2 lines
	putLCD('-');
  break; 
	
	case 2:
	cmdLCD(LCD_LINE1); //ready top line
	putLCD('-');       //print 4 lines
	putLCD('-');
	putLCD('-');
	putLCD('-');
  break; 
	
	case 4:
	cmdLCD(LCD_LINE1); //ready top line
	putLCD('-');       //print 6 lines
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
  break; 
	
	case 8:
	cmdLCD(LCD_LINE1); //ready top line
	putLCD('-');       //print 8 lines
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
  break;  
	
	case 16:
	cmdLCD(LCD_LINE1); //ready top line
	putLCD('-');       //print 10 lines
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
  break; 
	
	case 32:
	cmdLCD(LCD_LINE1); //ready top line
	putLCD('-');       //print 12 lines
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
  break; 
	
	case 64:
	cmdLCD(LCD_LINE1); //ready top line
	putLCD('-');       //print 14 lines
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
  break; 
	
	case 128:
	cmdLCD(LCD_LINE1); //ready top line
	putLCD('-');       //print 16 lines
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
	putLCD('-');
  break; 
 }
	
 if (LED==1){Target_LED_1_LCD();} //display first target LED (LED 6)
 if (LED==2){Target_LED_2_LCD();} //display first target LED (LED 5)
 if (LED==3){Target_LED_3_LCD();} //display first target LED (LED 4)
 
	putLCD(32);
	putLCD(32);
	putLCD(32);// position text far right >>
	putLCD(32);
	putLCD(LEVEL); //display current level
	putLCD(47);  //display '/'
	putLCD(x); //displays decimal 0-9
	putLCD(y); //displays decimal 0-9
	putLCD(z); //remains at 48 (decimal 0 as score increments in tens)
}

void HIGH_SCORE (int a, int b, int c) //This function is responsible for displaying the highest score
{ /* variables x and y change value depending on highest score*/
	putLCD(a); //displays decimal 0-9
	putLCD(b); //displays decimal 0-9
	putLCD(c); //remains at 48 (decimal 0 as score increments in tens)
}




void set_LCD_data(unsigned char d)
{
	
	//ClearDisplay();
	LCD_PORT->BSRR=(0xff<<(LCD_D0_pin+16));	//clear data lines
	LCD_PORT->BSRR=(d<<LCD_D0_pin);					//put data on lines
}

void LCD_strobe(void)		//10us high pulse on LCD enable line
{
	lcd_delayus(10);
	set_LCD_E();
	lcd_delayus(10);
	clr_LCD_E();
}


void cmdLCD(unsigned char cmd)		//sends a byte to the LCD control register
{
	BusyFlag();				//wait for LCD to be not busy
	clr_LCD_RS();					//control command
	clr_LCD_RW();					//write command
	set_LCD_data(cmd);		//set data on bus
	LCD_strobe();					//apply command
}

void putLCD(unsigned char put)	//sends a char to the LCD display
{
	BusyFlag();				//wait for LCD to be not busy
	set_LCD_RS();					//text command
	clr_LCD_RW();					//write command
	set_LCD_data(put);		//set data on bus
	LCD_strobe();					//apply command
}





void initLCD(void)
{
		SystemCoreClockUpdate();
		RCC->AHB1ENR|=RCC_AHB1ENR_GPIODEN;	//enable LCD port clock
	
	
			//CONFIG LCD GPIO PINS
		LCD_PORT->MODER&=~(					//clear pin direction settings
			(3u<<(2*LCD_RS_pin))
			|(3u<<(2*LCD_RW_pin))
			|(3u<<(2*LCD_E_pin))
			|(0xffff<<(2*LCD_D0_pin))
			);
	
	
	LCD_PORT->MODER|=(				//reset pin direction settings to digital outputs
			(1u<<(2*LCD_RS_pin))
			|(1u<<(2*LCD_RW_pin))
			|(1u<<(2*LCD_E_pin))
			|(0x5555<<(2*LCD_D0_pin))
		);

	
			//LCD INIT COMMANDS
	clr_LCD_RS();					//all lines default low
	clr_LCD_RW();
	clr_LCD_E();
	
	lcd_delayus(25000);		//25ms startup delay
	cmdLCD(0x38);	//Function set: 2 Line, 8-bit, 5x7 dots
	cmdLCD(0x0c);	//Display on, Cursor blinking command
	cmdLCD(0x01);	//Clear LCD
	cmdLCD(0x06);	//Entry mode, auto increment with no shift
}
