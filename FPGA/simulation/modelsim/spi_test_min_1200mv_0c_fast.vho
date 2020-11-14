-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.1.2 Build 203 01/18/2017 SJ Lite Edition"

-- DATE "08/23/2019 09:50:37"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	spi_test IS
    PORT (
	CLOCK_1_OP : OUT std_logic;
	\50MHz_CLK\ : IN std_logic;
	LED_7 : OUT std_logic;
	SCLK_IN : IN std_logic;
	CS_N : IN std_logic;
	MOSI_IN : IN std_logic;
	RESET_BUTTON2 : IN std_logic;
	RESET_BUTTON : IN std_logic;
	Switch_2 : IN std_logic;
	Switch_3 : IN std_logic;
	Switch_0 : IN std_logic;
	Switch_1 : IN std_logic;
	LED_6 : OUT std_logic;
	LED_5 : OUT std_logic;
	LED_4 : OUT std_logic;
	LED_3 : OUT std_logic;
	LED_2 : OUT std_logic;
	LED_1 : OUT std_logic;
	LED_0 : OUT std_logic;
	MISO : OUT std_logic
	);
END spi_test;

-- Design Ports Information
-- CLOCK_1_OP	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED_7	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED_6	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED_5	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED_4	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED_3	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED_2	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED_1	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED_0	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MISO	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 50MHz_CLK	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SCLK_IN	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESET_BUTTON2	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESET_BUTTON	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CS_N	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MOSI_IN	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switch_3	=>  Location: PIN_M15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switch_2	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switch_1	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switch_0	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF spi_test IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_1_OP : std_logic;
SIGNAL \ww_50MHz_CLK\ : std_logic;
SIGNAL ww_LED_7 : std_logic;
SIGNAL ww_SCLK_IN : std_logic;
SIGNAL ww_CS_N : std_logic;
SIGNAL ww_MOSI_IN : std_logic;
SIGNAL ww_RESET_BUTTON2 : std_logic;
SIGNAL ww_RESET_BUTTON : std_logic;
SIGNAL ww_Switch_2 : std_logic;
SIGNAL ww_Switch_3 : std_logic;
SIGNAL ww_Switch_0 : std_logic;
SIGNAL ww_Switch_1 : std_logic;
SIGNAL ww_LED_6 : std_logic;
SIGNAL ww_LED_5 : std_logic;
SIGNAL ww_LED_4 : std_logic;
SIGNAL ww_LED_3 : std_logic;
SIGNAL ww_LED_2 : std_logic;
SIGNAL ww_LED_1 : std_logic;
SIGNAL ww_LED_0 : std_logic;
SIGNAL ww_MISO : std_logic;
SIGNAL \inst14|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst14|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst14|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e_CLOCK_1_OP_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ADC_SDAT~ibuf_o\ : std_logic;
SIGNAL \ADC_SDAT~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DCLK~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_nCEO~~padout\ : std_logic;
SIGNAL \~ALTERA_DCLK~~obuf_o\ : std_logic;
SIGNAL \~ALTERA_nCEO~~obuf_o\ : std_logic;
SIGNAL \SCLK_IN~input_o\ : std_logic;
SIGNAL \inst3|Add1~0_combout\ : std_logic;
SIGNAL \RESET_BUTTON2~input_o\ : std_logic;
SIGNAL \CS_N~input_o\ : std_logic;
SIGNAL \RESET_BUTTON~input_o\ : std_logic;
SIGNAL \inst3|transmit:state[0]~0_combout\ : std_logic;
SIGNAL \inst3|transmit:state[0]~q\ : std_logic;
SIGNAL \inst3|Add1~1\ : std_logic;
SIGNAL \inst3|Add1~2_combout\ : std_logic;
SIGNAL \inst3|transmit:state[1]~q\ : std_logic;
SIGNAL \inst3|Add1~3\ : std_logic;
SIGNAL \inst3|Add1~4_combout\ : std_logic;
SIGNAL \inst3|transmit:state[2]~q\ : std_logic;
SIGNAL \inst3|Add1~5\ : std_logic;
SIGNAL \inst3|Add1~6_combout\ : std_logic;
SIGNAL \inst3|transmit:state[3]~q\ : std_logic;
SIGNAL \inst3|Add1~7\ : std_logic;
SIGNAL \inst3|Add1~8_combout\ : std_logic;
SIGNAL \inst3|state~1_combout\ : std_logic;
SIGNAL \inst3|transmit:state[4]~q\ : std_logic;
SIGNAL \inst3|Equal1~0_combout\ : std_logic;
SIGNAL \Switch_3~input_o\ : std_logic;
SIGNAL \inst3|sregout[3]~17_combout\ : std_logic;
SIGNAL \Switch_2~input_o\ : std_logic;
SIGNAL \inst3|sregout[2]~21_combout\ : std_logic;
SIGNAL \Switch_1~input_o\ : std_logic;
SIGNAL \inst3|sregout[1]~25_combout\ : std_logic;
SIGNAL \Switch_0~input_o\ : std_logic;
SIGNAL \inst3|sregout[0]~29_combout\ : std_logic;
SIGNAL \inst3|sregout[0]~31_combout\ : std_logic;
SIGNAL \inst3|sregout[0]~_emulated_q\ : std_logic;
SIGNAL \inst3|sregout[0]~30_combout\ : std_logic;
SIGNAL \inst3|Equal1~1_combout\ : std_logic;
SIGNAL \inst3|sregout[1]~27_combout\ : std_logic;
SIGNAL \inst3|sregout[1]~_emulated_q\ : std_logic;
SIGNAL \inst3|sregout[1]~26_combout\ : std_logic;
SIGNAL \inst3|sregout[2]~23_combout\ : std_logic;
SIGNAL \inst3|sregout[2]~_emulated_q\ : std_logic;
SIGNAL \inst3|sregout[2]~22_combout\ : std_logic;
SIGNAL \inst3|sregout[3]~19_combout\ : std_logic;
SIGNAL \inst3|sregout[3]~_emulated_q\ : std_logic;
SIGNAL \inst3|sregout[3]~18_combout\ : std_logic;
SIGNAL \inst3|sregout~47_combout\ : std_logic;
SIGNAL \inst3|sregout~45_combout\ : std_logic;
SIGNAL \inst3|sregout~44_combout\ : std_logic;
SIGNAL \inst3|sregout~43_combout\ : std_logic;
SIGNAL \inst3|sregout~42_combout\ : std_logic;
SIGNAL \inst3|sregout~41_combout\ : std_logic;
SIGNAL \inst3|sregout~40_combout\ : std_logic;
SIGNAL \inst3|sregout~39_combout\ : std_logic;
SIGNAL \inst3|sregout~38_combout\ : std_logic;
SIGNAL \inst3|sregout~37_combout\ : std_logic;
SIGNAL \inst3|sregout~36_combout\ : std_logic;
SIGNAL \inst3|sregout~35_combout\ : std_logic;
SIGNAL \inst3|sregout[15]~enfeeder_combout\ : std_logic;
SIGNAL \inst~combout\ : std_logic;
SIGNAL \inst~clkctrl_outclk\ : std_logic;
SIGNAL \inst3|sregout[15]~en_q\ : std_logic;
SIGNAL \inst3|sregout[15]~34_combout\ : std_logic;
SIGNAL \50MHz_CLK~input_o\ : std_logic;
SIGNAL \inst14|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \inst14|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e_CLOCK_1_OP_outclk\ : std_logic;
SIGNAL \MOSI_IN~input_o\ : std_logic;
SIGNAL \inst3|sregin[0]~feeder_combout\ : std_logic;
SIGNAL \inst3|sregin[1]~feeder_combout\ : std_logic;
SIGNAL \inst3|sregin[3]~feeder_combout\ : std_logic;
SIGNAL \inst3|sregin[4]~feeder_combout\ : std_logic;
SIGNAL \inst3|Add0~0_combout\ : std_logic;
SIGNAL \inst3|receive:state[0]~q\ : std_logic;
SIGNAL \inst3|Add0~1\ : std_logic;
SIGNAL \inst3|Add0~2_combout\ : std_logic;
SIGNAL \inst3|receive:state[1]~q\ : std_logic;
SIGNAL \inst3|Add0~3\ : std_logic;
SIGNAL \inst3|Add0~4_combout\ : std_logic;
SIGNAL \inst3|receive:state[2]~q\ : std_logic;
SIGNAL \inst3|Add0~5\ : std_logic;
SIGNAL \inst3|Add0~6_combout\ : std_logic;
SIGNAL \inst3|receive:state[3]~q\ : std_logic;
SIGNAL \inst3|Add0~7\ : std_logic;
SIGNAL \inst3|Add0~8_combout\ : std_logic;
SIGNAL \inst3|state~0_combout\ : std_logic;
SIGNAL \inst3|receive:state[4]~q\ : std_logic;
SIGNAL \inst3|Equal0~0_combout\ : std_logic;
SIGNAL \inst3|rx[7]~0_combout\ : std_logic;
SIGNAL \inst3|rx[6]~feeder_combout\ : std_logic;
SIGNAL \inst3|rx[5]~feeder_combout\ : std_logic;
SIGNAL \inst3|rx[4]~feeder_combout\ : std_logic;
SIGNAL \inst3|rx[3]~feeder_combout\ : std_logic;
SIGNAL \inst3|rx[2]~feeder_combout\ : std_logic;
SIGNAL \inst3|rx[0]~feeder_combout\ : std_logic;
SIGNAL \inst3|sregout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst14|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|rx\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst3|sregin\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_inst~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_CS_N~input_o\ : std_logic;
SIGNAL \ALT_INV_SCLK_IN~input_o\ : std_logic;
SIGNAL \inst3|ALT_INV_transmit:state[0]~0_combout\ : std_logic;

BEGIN

CLOCK_1_OP <= ww_CLOCK_1_OP;
\ww_50MHz_CLK\ <= \50MHz_CLK\;
LED_7 <= ww_LED_7;
ww_SCLK_IN <= SCLK_IN;
ww_CS_N <= CS_N;
ww_MOSI_IN <= MOSI_IN;
ww_RESET_BUTTON2 <= RESET_BUTTON2;
ww_RESET_BUTTON <= RESET_BUTTON;
ww_Switch_2 <= Switch_2;
ww_Switch_3 <= Switch_3;
ww_Switch_0 <= Switch_0;
ww_Switch_1 <= Switch_1;
LED_6 <= ww_LED_6;
LED_5 <= ww_LED_5;
LED_4 <= ww_LED_4;
LED_3 <= ww_LED_3;
LED_2 <= ww_LED_2;
LED_1 <= ww_LED_1;
LED_0 <= ww_LED_0;
MISO <= ww_MISO;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst14|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \50MHz_CLK~input_o\);

\inst14|altpll_component|auto_generated|wire_pll1_clk\(0) <= \inst14|altpll_component|auto_generated|pll1_CLK_bus\(0);
\inst14|altpll_component|auto_generated|wire_pll1_clk\(1) <= \inst14|altpll_component|auto_generated|pll1_CLK_bus\(1);
\inst14|altpll_component|auto_generated|wire_pll1_clk\(2) <= \inst14|altpll_component|auto_generated|pll1_CLK_bus\(2);
\inst14|altpll_component|auto_generated|wire_pll1_clk\(3) <= \inst14|altpll_component|auto_generated|pll1_CLK_bus\(3);
\inst14|altpll_component|auto_generated|wire_pll1_clk\(4) <= \inst14|altpll_component|auto_generated|pll1_CLK_bus\(4);

\inst~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst~combout\);

\inst14|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e_CLOCK_1_OP_INCLK_bus\ <= (vcc & vcc & vcc & \inst14|altpll_component|auto_generated|wire_pll1_clk\(0));
\ALT_INV_inst~clkctrl_outclk\ <= NOT \inst~clkctrl_outclk\;
\ALT_INV_CS_N~input_o\ <= NOT \CS_N~input_o\;
\ALT_INV_SCLK_IN~input_o\ <= NOT \SCLK_IN~input_o\;
\inst3|ALT_INV_transmit:state[0]~0_combout\ <= NOT \inst3|transmit:state[0]~0_combout\;

-- Location: IOOBUF_X16_Y34_N2
\MISO~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|sregout\(15),
	oe => \inst3|sregout[15]~34_combout\,
	devoe => ww_devoe,
	o => ww_MISO);

-- Location: IOOBUF_X49_Y0_N9
\CLOCK_1_OP~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst14|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e_CLOCK_1_OP_outclk\,
	devoe => ww_devoe,
	o => ww_CLOCK_1_OP);

-- Location: IOOBUF_X0_Y10_N23
\LED_7~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|rx\(7),
	devoe => ww_devoe,
	o => ww_LED_7);

-- Location: IOOBUF_X0_Y28_N9
\LED_6~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|rx\(6),
	devoe => ww_devoe,
	o => ww_LED_6);

-- Location: IOOBUF_X0_Y26_N16
\LED_5~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|rx\(5),
	devoe => ww_devoe,
	o => ww_LED_5);

-- Location: IOOBUF_X0_Y25_N9
\LED_4~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|rx\(4),
	devoe => ww_devoe,
	o => ww_LED_4);

-- Location: IOOBUF_X40_Y34_N2
\LED_3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|rx\(3),
	devoe => ww_devoe,
	o => ww_LED_3);

-- Location: IOOBUF_X49_Y34_N9
\LED_2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|rx\(2),
	devoe => ww_devoe,
	o => ww_LED_2);

-- Location: IOOBUF_X49_Y34_N2
\LED_1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|rx\(1),
	devoe => ww_devoe,
	o => ww_LED_1);

-- Location: IOOBUF_X38_Y34_N16
\LED_0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|rx\(0),
	devoe => ww_devoe,
	o => ww_LED_0);

-- Location: IOIBUF_X5_Y34_N15
\SCLK_IN~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SCLK_IN,
	o => \SCLK_IN~input_o\);

-- Location: LCCOMB_X5_Y33_N20
\inst3|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Add1~0_combout\ = \inst3|transmit:state[0]~q\ $ (VCC)
-- \inst3|Add1~1\ = CARRY(\inst3|transmit:state[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|transmit:state[0]~q\,
	datad => VCC,
	combout => \inst3|Add1~0_combout\,
	cout => \inst3|Add1~1\);

-- Location: IOIBUF_X23_Y34_N15
\RESET_BUTTON2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESET_BUTTON2,
	o => \RESET_BUTTON2~input_o\);

-- Location: IOIBUF_X7_Y34_N8
\CS_N~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CS_N,
	o => \CS_N~input_o\);

-- Location: IOIBUF_X53_Y14_N1
\RESET_BUTTON~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESET_BUTTON,
	o => \RESET_BUTTON~input_o\);

-- Location: LCCOMB_X6_Y33_N0
\inst3|transmit:state[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|transmit:state[0]~0_combout\ = (\CS_N~input_o\) # ((!\RESET_BUTTON2~input_o\ & !\RESET_BUTTON~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RESET_BUTTON2~input_o\,
	datab => \CS_N~input_o\,
	datad => \RESET_BUTTON~input_o\,
	combout => \inst3|transmit:state[0]~0_combout\);

-- Location: FF_X5_Y33_N21
\inst3|transmit:state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|Add1~0_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|transmit:state[0]~q\);

-- Location: LCCOMB_X5_Y33_N22
\inst3|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Add1~2_combout\ = (\inst3|transmit:state[1]~q\ & (!\inst3|Add1~1\)) # (!\inst3|transmit:state[1]~q\ & ((\inst3|Add1~1\) # (GND)))
-- \inst3|Add1~3\ = CARRY((!\inst3|Add1~1\) # (!\inst3|transmit:state[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|transmit:state[1]~q\,
	datad => VCC,
	cin => \inst3|Add1~1\,
	combout => \inst3|Add1~2_combout\,
	cout => \inst3|Add1~3\);

-- Location: FF_X5_Y33_N23
\inst3|transmit:state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|Add1~2_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|transmit:state[1]~q\);

-- Location: LCCOMB_X5_Y33_N24
\inst3|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Add1~4_combout\ = (\inst3|transmit:state[2]~q\ & (\inst3|Add1~3\ $ (GND))) # (!\inst3|transmit:state[2]~q\ & (!\inst3|Add1~3\ & VCC))
-- \inst3|Add1~5\ = CARRY((\inst3|transmit:state[2]~q\ & !\inst3|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|transmit:state[2]~q\,
	datad => VCC,
	cin => \inst3|Add1~3\,
	combout => \inst3|Add1~4_combout\,
	cout => \inst3|Add1~5\);

-- Location: FF_X5_Y33_N25
\inst3|transmit:state[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|Add1~4_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|transmit:state[2]~q\);

-- Location: LCCOMB_X5_Y33_N26
\inst3|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Add1~6_combout\ = (\inst3|transmit:state[3]~q\ & (!\inst3|Add1~5\)) # (!\inst3|transmit:state[3]~q\ & ((\inst3|Add1~5\) # (GND)))
-- \inst3|Add1~7\ = CARRY((!\inst3|Add1~5\) # (!\inst3|transmit:state[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|transmit:state[3]~q\,
	datad => VCC,
	cin => \inst3|Add1~5\,
	combout => \inst3|Add1~6_combout\,
	cout => \inst3|Add1~7\);

-- Location: FF_X5_Y33_N27
\inst3|transmit:state[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|Add1~6_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|transmit:state[3]~q\);

-- Location: LCCOMB_X5_Y33_N28
\inst3|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Add1~8_combout\ = \inst3|transmit:state[4]~q\ $ (!\inst3|Add1~7\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|transmit:state[4]~q\,
	cin => \inst3|Add1~7\,
	combout => \inst3|Add1~8_combout\);

-- Location: LCCOMB_X5_Y33_N12
\inst3|state~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|state~1_combout\ = (\inst3|Add1~8_combout\ & ((!\inst3|transmit:state[1]~q\) # (!\inst3|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~0_combout\,
	datac => \inst3|transmit:state[1]~q\,
	datad => \inst3|Add1~8_combout\,
	combout => \inst3|state~1_combout\);

-- Location: FF_X5_Y33_N13
\inst3|transmit:state[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|state~1_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|transmit:state[4]~q\);

-- Location: LCCOMB_X5_Y33_N10
\inst3|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Equal1~0_combout\ = (!\inst3|transmit:state[4]~q\ & (\inst3|transmit:state[0]~q\ & (\inst3|transmit:state[3]~q\ & \inst3|transmit:state[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|transmit:state[4]~q\,
	datab => \inst3|transmit:state[0]~q\,
	datac => \inst3|transmit:state[3]~q\,
	datad => \inst3|transmit:state[2]~q\,
	combout => \inst3|Equal1~0_combout\);

-- Location: IOIBUF_X53_Y17_N15
\Switch_3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switch_3,
	o => \Switch_3~input_o\);

-- Location: LCCOMB_X8_Y33_N26
\inst3|sregout[3]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[3]~17_combout\ = (\CS_N~input_o\ & (\Switch_3~input_o\)) # (!\CS_N~input_o\ & ((\inst3|sregout[3]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Switch_3~input_o\,
	datac => \inst3|sregout[3]~17_combout\,
	datad => \CS_N~input_o\,
	combout => \inst3|sregout[3]~17_combout\);

-- Location: IOIBUF_X25_Y34_N8
\Switch_2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switch_2,
	o => \Switch_2~input_o\);

-- Location: LCCOMB_X7_Y33_N20
\inst3|sregout[2]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[2]~21_combout\ = (\CS_N~input_o\ & (\Switch_2~input_o\)) # (!\CS_N~input_o\ & ((\inst3|sregout[2]~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Switch_2~input_o\,
	datac => \CS_N~input_o\,
	datad => \inst3|sregout[2]~21_combout\,
	combout => \inst3|sregout[2]~21_combout\);

-- Location: IOIBUF_X27_Y0_N15
\Switch_1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switch_1,
	o => \Switch_1~input_o\);

-- Location: LCCOMB_X7_Y33_N6
\inst3|sregout[1]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[1]~25_combout\ = (\CS_N~input_o\ & ((\Switch_1~input_o\))) # (!\CS_N~input_o\ & (\inst3|sregout[1]~25_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|sregout[1]~25_combout\,
	datab => \Switch_1~input_o\,
	datad => \CS_N~input_o\,
	combout => \inst3|sregout[1]~25_combout\);

-- Location: IOIBUF_X0_Y16_N22
\Switch_0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switch_0,
	o => \Switch_0~input_o\);

-- Location: LCCOMB_X6_Y33_N28
\inst3|sregout[0]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[0]~29_combout\ = (\CS_N~input_o\ & (\Switch_0~input_o\)) # (!\CS_N~input_o\ & ((\inst3|sregout[0]~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Switch_0~input_o\,
	datab => \inst3|sregout[0]~29_combout\,
	datad => \CS_N~input_o\,
	combout => \inst3|sregout[0]~29_combout\);

-- Location: LCCOMB_X6_Y33_N2
\inst3|sregout[0]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[0]~31_combout\ = \inst3|sregout[0]~29_combout\ $ (((\inst3|Equal1~0_combout\ & (\Switch_0~input_o\ & \inst3|transmit:state[1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~0_combout\,
	datab => \inst3|sregout[0]~29_combout\,
	datac => \Switch_0~input_o\,
	datad => \inst3|transmit:state[1]~q\,
	combout => \inst3|sregout[0]~31_combout\);

-- Location: FF_X6_Y33_N3
\inst3|sregout[0]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout[0]~31_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout[0]~_emulated_q\);

-- Location: LCCOMB_X7_Y33_N10
\inst3|sregout[0]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[0]~30_combout\ = (\CS_N~input_o\ & (((\Switch_0~input_o\)))) # (!\CS_N~input_o\ & (\inst3|sregout[0]~29_combout\ $ (((\inst3|sregout[0]~_emulated_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CS_N~input_o\,
	datab => \inst3|sregout[0]~29_combout\,
	datac => \Switch_0~input_o\,
	datad => \inst3|sregout[0]~_emulated_q\,
	combout => \inst3|sregout[0]~30_combout\);

-- Location: LCCOMB_X7_Y33_N0
\inst3|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Equal1~1_combout\ = (\inst3|transmit:state[1]~q\ & \inst3|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|transmit:state[1]~q\,
	datad => \inst3|Equal1~0_combout\,
	combout => \inst3|Equal1~1_combout\);

-- Location: LCCOMB_X7_Y33_N18
\inst3|sregout[1]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[1]~27_combout\ = \inst3|sregout[1]~25_combout\ $ (((\inst3|Equal1~1_combout\ & (\Switch_1~input_o\)) # (!\inst3|Equal1~1_combout\ & ((\inst3|sregout[0]~30_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Switch_1~input_o\,
	datab => \inst3|sregout[1]~25_combout\,
	datac => \inst3|sregout[0]~30_combout\,
	datad => \inst3|Equal1~1_combout\,
	combout => \inst3|sregout[1]~27_combout\);

-- Location: FF_X7_Y33_N19
\inst3|sregout[1]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout[1]~27_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout[1]~_emulated_q\);

-- Location: LCCOMB_X7_Y33_N16
\inst3|sregout[1]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[1]~26_combout\ = (\CS_N~input_o\ & (\Switch_1~input_o\)) # (!\CS_N~input_o\ & ((\inst3|sregout[1]~_emulated_q\ $ (\inst3|sregout[1]~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Switch_1~input_o\,
	datab => \CS_N~input_o\,
	datac => \inst3|sregout[1]~_emulated_q\,
	datad => \inst3|sregout[1]~25_combout\,
	combout => \inst3|sregout[1]~26_combout\);

-- Location: LCCOMB_X7_Y33_N14
\inst3|sregout[2]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[2]~23_combout\ = \inst3|sregout[2]~21_combout\ $ (((\inst3|Equal1~1_combout\ & (\Switch_2~input_o\)) # (!\inst3|Equal1~1_combout\ & ((\inst3|sregout[1]~26_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|sregout[2]~21_combout\,
	datab => \Switch_2~input_o\,
	datac => \inst3|sregout[1]~26_combout\,
	datad => \inst3|Equal1~1_combout\,
	combout => \inst3|sregout[2]~23_combout\);

-- Location: FF_X7_Y33_N15
\inst3|sregout[2]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout[2]~23_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout[2]~_emulated_q\);

-- Location: LCCOMB_X7_Y33_N4
\inst3|sregout[2]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[2]~22_combout\ = (\CS_N~input_o\ & (\Switch_2~input_o\)) # (!\CS_N~input_o\ & ((\inst3|sregout[2]~_emulated_q\ $ (\inst3|sregout[2]~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Switch_2~input_o\,
	datab => \CS_N~input_o\,
	datac => \inst3|sregout[2]~_emulated_q\,
	datad => \inst3|sregout[2]~21_combout\,
	combout => \inst3|sregout[2]~22_combout\);

-- Location: LCCOMB_X7_Y33_N24
\inst3|sregout[3]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[3]~19_combout\ = \inst3|sregout[3]~17_combout\ $ (((\inst3|Equal1~1_combout\ & (\Switch_3~input_o\)) # (!\inst3|Equal1~1_combout\ & ((\inst3|sregout[2]~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Switch_3~input_o\,
	datab => \inst3|sregout[3]~17_combout\,
	datac => \inst3|sregout[2]~22_combout\,
	datad => \inst3|Equal1~1_combout\,
	combout => \inst3|sregout[3]~19_combout\);

-- Location: FF_X7_Y33_N25
\inst3|sregout[3]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout[3]~19_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout[3]~_emulated_q\);

-- Location: LCCOMB_X8_Y33_N8
\inst3|sregout[3]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[3]~18_combout\ = (\CS_N~input_o\ & (((\Switch_3~input_o\)))) # (!\CS_N~input_o\ & (\inst3|sregout[3]~17_combout\ $ (((\inst3|sregout[3]~_emulated_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010111001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|sregout[3]~17_combout\,
	datab => \Switch_3~input_o\,
	datac => \CS_N~input_o\,
	datad => \inst3|sregout[3]~_emulated_q\,
	combout => \inst3|sregout[3]~18_combout\);

-- Location: LCCOMB_X8_Y33_N22
\inst3|sregout~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~47_combout\ = (\inst3|sregout[3]~18_combout\ & ((!\inst3|transmit:state[1]~q\) # (!\inst3|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|sregout[3]~18_combout\,
	datac => \inst3|Equal1~0_combout\,
	datad => \inst3|transmit:state[1]~q\,
	combout => \inst3|sregout~47_combout\);

-- Location: FF_X8_Y33_N23
\inst3|sregout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~47_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(4));

-- Location: LCCOMB_X5_Y33_N2
\inst3|sregout~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~45_combout\ = (\inst3|sregout\(4) & ((!\inst3|transmit:state[1]~q\) # (!\inst3|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~0_combout\,
	datac => \inst3|transmit:state[1]~q\,
	datad => \inst3|sregout\(4),
	combout => \inst3|sregout~45_combout\);

-- Location: FF_X5_Y33_N3
\inst3|sregout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~45_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(5));

-- Location: LCCOMB_X5_Y33_N6
\inst3|sregout~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~44_combout\ = (\inst3|sregout\(5) & ((!\inst3|transmit:state[1]~q\) # (!\inst3|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~0_combout\,
	datac => \inst3|transmit:state[1]~q\,
	datad => \inst3|sregout\(5),
	combout => \inst3|sregout~44_combout\);

-- Location: FF_X5_Y33_N7
\inst3|sregout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~44_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(6));

-- Location: LCCOMB_X5_Y33_N16
\inst3|sregout~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~43_combout\ = (\inst3|sregout\(6) & ((!\inst3|transmit:state[1]~q\) # (!\inst3|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~0_combout\,
	datac => \inst3|transmit:state[1]~q\,
	datad => \inst3|sregout\(6),
	combout => \inst3|sregout~43_combout\);

-- Location: FF_X5_Y33_N17
\inst3|sregout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~43_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(7));

-- Location: LCCOMB_X5_Y33_N30
\inst3|sregout~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~42_combout\ = (\inst3|sregout\(7) & ((!\inst3|transmit:state[1]~q\) # (!\inst3|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~0_combout\,
	datac => \inst3|transmit:state[1]~q\,
	datad => \inst3|sregout\(7),
	combout => \inst3|sregout~42_combout\);

-- Location: FF_X5_Y33_N31
\inst3|sregout[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~42_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(8));

-- Location: LCCOMB_X5_Y33_N4
\inst3|sregout~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~41_combout\ = (\inst3|sregout\(8) & ((!\inst3|Equal1~0_combout\) # (!\inst3|transmit:state[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|sregout\(8),
	datac => \inst3|transmit:state[1]~q\,
	datad => \inst3|Equal1~0_combout\,
	combout => \inst3|sregout~41_combout\);

-- Location: FF_X5_Y33_N5
\inst3|sregout[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~41_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(9));

-- Location: LCCOMB_X5_Y33_N14
\inst3|sregout~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~40_combout\ = (\inst3|sregout\(9) & ((!\inst3|transmit:state[1]~q\) # (!\inst3|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~0_combout\,
	datab => \inst3|sregout\(9),
	datac => \inst3|transmit:state[1]~q\,
	combout => \inst3|sregout~40_combout\);

-- Location: FF_X5_Y33_N15
\inst3|sregout[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~40_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(10));

-- Location: LCCOMB_X5_Y33_N8
\inst3|sregout~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~39_combout\ = (\inst3|sregout\(10) & ((!\inst3|Equal1~0_combout\) # (!\inst3|transmit:state[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|sregout\(10),
	datac => \inst3|transmit:state[1]~q\,
	datad => \inst3|Equal1~0_combout\,
	combout => \inst3|sregout~39_combout\);

-- Location: FF_X5_Y33_N9
\inst3|sregout[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~39_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(11));

-- Location: LCCOMB_X5_Y33_N18
\inst3|sregout~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~38_combout\ = (\inst3|sregout\(11) & ((!\inst3|Equal1~0_combout\) # (!\inst3|transmit:state[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|sregout\(11),
	datac => \inst3|transmit:state[1]~q\,
	datad => \inst3|Equal1~0_combout\,
	combout => \inst3|sregout~38_combout\);

-- Location: FF_X5_Y33_N19
\inst3|sregout[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~38_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(12));

-- Location: LCCOMB_X5_Y33_N0
\inst3|sregout~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~37_combout\ = (\inst3|sregout\(12) & ((!\inst3|transmit:state[1]~q\) # (!\inst3|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~0_combout\,
	datac => \inst3|transmit:state[1]~q\,
	datad => \inst3|sregout\(12),
	combout => \inst3|sregout~37_combout\);

-- Location: FF_X5_Y33_N1
\inst3|sregout[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~37_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(13));

-- Location: LCCOMB_X6_Y33_N24
\inst3|sregout~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~36_combout\ = (\inst3|sregout\(13) & ((!\inst3|Equal1~0_combout\) # (!\inst3|transmit:state[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|transmit:state[1]~q\,
	datac => \inst3|sregout\(13),
	datad => \inst3|Equal1~0_combout\,
	combout => \inst3|sregout~36_combout\);

-- Location: FF_X6_Y33_N25
\inst3|sregout[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~36_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(14));

-- Location: LCCOMB_X6_Y33_N20
\inst3|sregout~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout~35_combout\ = (\inst3|sregout\(14) & ((!\inst3|transmit:state[1]~q\) # (!\inst3|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~0_combout\,
	datab => \inst3|sregout\(14),
	datad => \inst3|transmit:state[1]~q\,
	combout => \inst3|sregout~35_combout\);

-- Location: FF_X6_Y33_N21
\inst3|sregout[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout~35_combout\,
	clrn => \ALT_INV_CS_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout\(15));

-- Location: LCCOMB_X4_Y33_N24
\inst3|sregout[15]~enfeeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[15]~enfeeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst3|sregout[15]~enfeeder_combout\);

-- Location: LCCOMB_X25_Y33_N0
inst : cycloneive_lcell_comb
-- Equation(s):
-- \inst~combout\ = (!\RESET_BUTTON2~input_o\ & !\RESET_BUTTON~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RESET_BUTTON2~input_o\,
	datad => \RESET_BUTTON~input_o\,
	combout => \inst~combout\);

-- Location: CLKCTRL_G14
\inst~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst~clkctrl_outclk\);

-- Location: FF_X4_Y33_N25
\inst3|sregout[15]~en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SCLK_IN~input_o\,
	d => \inst3|sregout[15]~enfeeder_combout\,
	clrn => \ALT_INV_inst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregout[15]~en_q\);

-- Location: LCCOMB_X8_Y33_N24
\inst3|sregout[15]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregout[15]~34_combout\ = (!\CS_N~input_o\ & \inst3|sregout[15]~en_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CS_N~input_o\,
	datad => \inst3|sregout[15]~en_q\,
	combout => \inst3|sregout[15]~34_combout\);

-- Location: IOIBUF_X27_Y0_N22
\50MHz_CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_50MHz_CLK\,
	o => \50MHz_CLK~input_o\);

-- Location: PLL_4
\inst14|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 250,
	c0_initial => 1,
	c0_low => 250,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 50,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 1,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 10,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 250,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	fbin => \inst14|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \inst14|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \inst14|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \inst14|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_PLL4E0
\inst14|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e_CLOCK_1_OP\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "external clock output",
	ena_register_mode => "double register")
-- pragma translate_on
PORT MAP (
	inclk => \inst14|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e_CLOCK_1_OP_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst14|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e_CLOCK_1_OP_outclk\);

-- Location: IOIBUF_X9_Y34_N8
\MOSI_IN~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MOSI_IN,
	o => \MOSI_IN~input_o\);

-- Location: LCCOMB_X6_Y33_N4
\inst3|sregin[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregin[0]~feeder_combout\ = \MOSI_IN~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MOSI_IN~input_o\,
	combout => \inst3|sregin[0]~feeder_combout\);

-- Location: FF_X6_Y33_N5
\inst3|sregin[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|sregin[0]~feeder_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregin\(0));

-- Location: LCCOMB_X6_Y33_N26
\inst3|sregin[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregin[1]~feeder_combout\ = \inst3|sregin\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst3|sregin\(0),
	combout => \inst3|sregin[1]~feeder_combout\);

-- Location: FF_X6_Y33_N27
\inst3|sregin[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|sregin[1]~feeder_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregin\(1));

-- Location: FF_X6_Y33_N29
\inst3|sregin[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	asdata => \inst3|sregin\(1),
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregin\(2));

-- Location: LCCOMB_X6_Y33_N22
\inst3|sregin[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregin[3]~feeder_combout\ = \inst3|sregin\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst3|sregin\(2),
	combout => \inst3|sregin[3]~feeder_combout\);

-- Location: FF_X6_Y33_N23
\inst3|sregin[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|sregin[3]~feeder_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregin\(3));

-- Location: LCCOMB_X6_Y33_N6
\inst3|sregin[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|sregin[4]~feeder_combout\ = \inst3|sregin\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst3|sregin\(3),
	combout => \inst3|sregin[4]~feeder_combout\);

-- Location: FF_X6_Y33_N7
\inst3|sregin[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|sregin[4]~feeder_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregin\(4));

-- Location: FF_X6_Y33_N17
\inst3|sregin[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	asdata => \inst3|sregin\(4),
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregin\(5));

-- Location: FF_X6_Y33_N1
\inst3|sregin[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	asdata => \inst3|sregin\(5),
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|sregin\(6));

-- Location: LCCOMB_X6_Y33_N8
\inst3|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Add0~0_combout\ = \inst3|receive:state[0]~q\ $ (VCC)
-- \inst3|Add0~1\ = CARRY(\inst3|receive:state[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|receive:state[0]~q\,
	datad => VCC,
	combout => \inst3|Add0~0_combout\,
	cout => \inst3|Add0~1\);

-- Location: FF_X6_Y33_N9
\inst3|receive:state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|Add0~0_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|receive:state[0]~q\);

-- Location: LCCOMB_X6_Y33_N10
\inst3|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Add0~2_combout\ = (\inst3|receive:state[1]~q\ & (!\inst3|Add0~1\)) # (!\inst3|receive:state[1]~q\ & ((\inst3|Add0~1\) # (GND)))
-- \inst3|Add0~3\ = CARRY((!\inst3|Add0~1\) # (!\inst3|receive:state[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|receive:state[1]~q\,
	datad => VCC,
	cin => \inst3|Add0~1\,
	combout => \inst3|Add0~2_combout\,
	cout => \inst3|Add0~3\);

-- Location: FF_X6_Y33_N11
\inst3|receive:state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|Add0~2_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|receive:state[1]~q\);

-- Location: LCCOMB_X6_Y33_N12
\inst3|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Add0~4_combout\ = (\inst3|receive:state[2]~q\ & (\inst3|Add0~3\ $ (GND))) # (!\inst3|receive:state[2]~q\ & (!\inst3|Add0~3\ & VCC))
-- \inst3|Add0~5\ = CARRY((\inst3|receive:state[2]~q\ & !\inst3|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|receive:state[2]~q\,
	datad => VCC,
	cin => \inst3|Add0~3\,
	combout => \inst3|Add0~4_combout\,
	cout => \inst3|Add0~5\);

-- Location: FF_X6_Y33_N13
\inst3|receive:state[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|Add0~4_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|receive:state[2]~q\);

-- Location: LCCOMB_X6_Y33_N14
\inst3|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Add0~6_combout\ = (\inst3|receive:state[3]~q\ & (!\inst3|Add0~5\)) # (!\inst3|receive:state[3]~q\ & ((\inst3|Add0~5\) # (GND)))
-- \inst3|Add0~7\ = CARRY((!\inst3|Add0~5\) # (!\inst3|receive:state[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|receive:state[3]~q\,
	datad => VCC,
	cin => \inst3|Add0~5\,
	combout => \inst3|Add0~6_combout\,
	cout => \inst3|Add0~7\);

-- Location: FF_X6_Y33_N15
\inst3|receive:state[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|Add0~6_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|receive:state[3]~q\);

-- Location: LCCOMB_X6_Y33_N16
\inst3|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Add0~8_combout\ = \inst3|Add0~7\ $ (!\inst3|receive:state[4]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst3|receive:state[4]~q\,
	cin => \inst3|Add0~7\,
	combout => \inst3|Add0~8_combout\);

-- Location: LCCOMB_X6_Y33_N18
\inst3|state~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|state~0_combout\ = (\inst3|Add0~8_combout\ & ((!\inst3|receive:state[1]~q\) # (!\inst3|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal0~0_combout\,
	datac => \inst3|receive:state[1]~q\,
	datad => \inst3|Add0~8_combout\,
	combout => \inst3|state~0_combout\);

-- Location: FF_X6_Y33_N19
\inst3|receive:state[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|state~0_combout\,
	clrn => \inst3|ALT_INV_transmit:state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|receive:state[4]~q\);

-- Location: LCCOMB_X6_Y33_N30
\inst3|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|Equal0~0_combout\ = (\inst3|receive:state[2]~q\ & (\inst3|receive:state[3]~q\ & (\inst3|receive:state[0]~q\ & !\inst3|receive:state[4]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|receive:state[2]~q\,
	datab => \inst3|receive:state[3]~q\,
	datac => \inst3|receive:state[0]~q\,
	datad => \inst3|receive:state[4]~q\,
	combout => \inst3|Equal0~0_combout\);

-- Location: LCCOMB_X7_Y33_N8
\inst3|rx[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|rx[7]~0_combout\ = (\inst3|receive:state[1]~q\ & (!\CS_N~input_o\ & \inst3|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|receive:state[1]~q\,
	datab => \CS_N~input_o\,
	datad => \inst3|Equal0~0_combout\,
	combout => \inst3|rx[7]~0_combout\);

-- Location: FF_X7_Y33_N9
\inst3|rx[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	asdata => \inst3|sregin\(6),
	clrn => \ALT_INV_inst~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|rx[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|rx\(7));

-- Location: LCCOMB_X7_Y33_N30
\inst3|rx[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|rx[6]~feeder_combout\ = \inst3|sregin\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst3|sregin\(5),
	combout => \inst3|rx[6]~feeder_combout\);

-- Location: FF_X7_Y33_N31
\inst3|rx[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|rx[6]~feeder_combout\,
	clrn => \ALT_INV_inst~clkctrl_outclk\,
	ena => \inst3|rx[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|rx\(6));

-- Location: LCCOMB_X7_Y33_N12
\inst3|rx[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|rx[5]~feeder_combout\ = \inst3|sregin\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst3|sregin\(4),
	combout => \inst3|rx[5]~feeder_combout\);

-- Location: FF_X7_Y33_N13
\inst3|rx[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|rx[5]~feeder_combout\,
	clrn => \ALT_INV_inst~clkctrl_outclk\,
	ena => \inst3|rx[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|rx\(5));

-- Location: LCCOMB_X7_Y33_N2
\inst3|rx[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|rx[4]~feeder_combout\ = \inst3|sregin\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst3|sregin\(3),
	combout => \inst3|rx[4]~feeder_combout\);

-- Location: FF_X7_Y33_N3
\inst3|rx[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|rx[4]~feeder_combout\,
	clrn => \ALT_INV_inst~clkctrl_outclk\,
	ena => \inst3|rx[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|rx\(4));

-- Location: LCCOMB_X7_Y33_N28
\inst3|rx[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|rx[3]~feeder_combout\ = \inst3|sregin\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst3|sregin\(2),
	combout => \inst3|rx[3]~feeder_combout\);

-- Location: FF_X7_Y33_N29
\inst3|rx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|rx[3]~feeder_combout\,
	clrn => \ALT_INV_inst~clkctrl_outclk\,
	ena => \inst3|rx[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|rx\(3));

-- Location: LCCOMB_X7_Y33_N22
\inst3|rx[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|rx[2]~feeder_combout\ = \inst3|sregin\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst3|sregin\(1),
	combout => \inst3|rx[2]~feeder_combout\);

-- Location: FF_X7_Y33_N23
\inst3|rx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|rx[2]~feeder_combout\,
	clrn => \ALT_INV_inst~clkctrl_outclk\,
	ena => \inst3|rx[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|rx\(2));

-- Location: FF_X7_Y33_N1
\inst3|rx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	asdata => \inst3|sregin\(0),
	clrn => \ALT_INV_inst~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|rx[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|rx\(1));

-- Location: LCCOMB_X7_Y33_N26
\inst3|rx[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|rx[0]~feeder_combout\ = \MOSI_IN~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MOSI_IN~input_o\,
	combout => \inst3|rx[0]~feeder_combout\);

-- Location: FF_X7_Y33_N27
\inst3|rx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK_IN~input_o\,
	d => \inst3|rx[0]~feeder_combout\,
	clrn => \ALT_INV_inst~clkctrl_outclk\,
	ena => \inst3|rx[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|rx\(0));
END structure;


