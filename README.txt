This is a brief description of what i've done:

Onboard LEDs:
Green: This flashes representing the rate at which the fpga LED sequence is operating
the LED toggles on/off when the shifted LED reaches each side.
Blue: The blue light turns on when the user button is successfully pressed on the correct LED. 
It then turns off just as the following sequence begins.
Red: This toggles on/off every 100ms as the interrupt is triggered. Every flash represents 2 ADC samples 
(as LED is on every 200ms).

Switches/inputs:
The blue user button is configured as an input, push pull, pull up resistor.
It is used to move to the next sequence if succesfully pushed.
if not, it moves to the 'wrong LED' sequence.

LCD:
for the LCD, on the top line, i have a progression line matching the same rate as the sequence.
The target LED is displayed on the bottom line on the left and the level/score is displayed on the right.
If the button is unsuccessfully pressed, 'GAME OVER appears on the top line then the current score
is displayed on the top line along with the highest score on the bottom line.

USART:
The usart constantly updates with voltage samples from the ADC as the interrupt triggers every 100ms.
This is displayed on one line, on the left hand side.
The target LED is also displayed on the same line on the right hand side.

DAC:
The DAC outputs between 0v and 3v at the same rate as the fpga LED sequence. 0-3v as the LED is shifted one side
and 3-0v as it's shifted to the other side.

ADC:
The ADC samples the DAC output at a constant rate of 100ms using an interrupt.

Timers/interrupts:
I've initialised a timer to trigger an interrupt every 100ms.
This interrupt is responsible for the ADC sampling the output of the DAC.
It is also used to display the ADC reading to the terminal via usart. 
The red onboard LED is toggled on/off after entering the interrupt.

Spi/FPGA:
FPGA LEDs are selected using bits 0-7 (1,2,4,8,16,32,64,128).
i've used 'for loops' to shift a single LED along the row with delays in between.
These delays vary on the sequence level (easy(slow) - hard(fast).
I have 3 levels of difficulty which loop depending on the player successfully pressing the button.
If unsuccessfull, game is reset to beginning sequence.
