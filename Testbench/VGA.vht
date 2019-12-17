-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "01/18/2015 23:28:56"
                                                            
-- Vhdl Test Bench template for design  :  VGA
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- Company: TEIS AB
-- Engineer: Jasim Abbasi
-- Create Date: 2015 Febrary 2
-- Design Name: VGA
-- Target Devices: ALTERA Cyclone IV EP4CE115F29C7
-- Tool versions: Quartus v11 and ModelSim
-- I/O Pin Description
-- VGA_CLK: PIN_Y2
-- KEY[2..0]: N21,M21,M23
-- reset_n: Y23
-- Detail discription of the other pin assignment in the manual

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY VGA_vhd_tst IS
END VGA_vhd_tst;
ARCHITECTURE VGA_arch OF VGA_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL HC : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL reset_n : STD_LOGIC;
SIGNAL VC : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL VGA_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL VGA_BLANK_N : STD_LOGIC;
SIGNAL VGA_CLK : STD_LOGIC;
SIGNAL VGA_G : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL VGA_HS : STD_LOGIC;
SIGNAL VGA_R : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL VGA_SYNC_N : STD_LOGIC;
SIGNAL VGA_VS : STD_LOGIC;
COMPONENT VGA
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	HC : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	reset_n : IN STD_LOGIC;
	VC : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	VGA_B : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	VGA_BLANK_N : OUT STD_LOGIC;
	VGA_CLK : OUT STD_LOGIC;
	VGA_G : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	VGA_HS : OUT STD_LOGIC;
	VGA_R : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	VGA_SYNC_N : OUT STD_LOGIC;
	VGA_VS : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : VGA
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	HC => HC,
	KEY => KEY,
	reset_n => reset_n,
	VC => VC,
	VGA_B => VGA_B,
	VGA_BLANK_N => VGA_BLANK_N,
	VGA_CLK => VGA_CLK,
	VGA_G => VGA_G,
	VGA_HS => VGA_HS,
	VGA_R => VGA_R,
	VGA_SYNC_N => VGA_SYNC_N,
	VGA_VS => VGA_VS
	);
clk_signal: process
    begin
	 --------clOCK SIGNAL---------
        CLOCK_50<='1';
		   wait for 5 ps;
		 --wait on clk, reset;
        CLOCK_50<='0';
        wait for 5 ps;
		 --wait on clk, reset;
 end process;			
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once 
          reset_n<='0';
		   wait for 50 ps;
			--- Test Case 1-------
			reset_n<='1';
			 key<="110";	
			 wait for 500 ps;
			 --- Test Case 2-------
			key<="101";
			 wait for 500 ps;
			 --- Test Case 3-------
			key<="011";
			  wait for 500 ps;
			key<="110";
			 wait for 500 ps;
			key<="101";	
         wait for 500 ps;
			key<="011";	
			 wait for 500 ps;
			key<="010";
			 reset_n<='1';
			 wait for 250 ps;
			key<="100";
	      wait for 250 ps;
			key<="001";
						  
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END VGA_arch;
