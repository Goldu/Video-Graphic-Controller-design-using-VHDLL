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
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.all ;
entity VGA is
port( reset_n, CLOCK_50 : in std_logic;
-- till VGA enheten
 HC : out std_logic_vector(10-1 downto 0);
   VC : out std_logic_vector(10-1 downto 0);
	----------------VGA_ Signals------------------
   VGA_HS, VGA_VS, VGA_CLK : out std_logic; -- Vertical, horizantal sync and clk signal
    VGA_BLANK_N, VGA_SYNC_N : out std_logic;
    VGA_B, VGA_G, VGA_R : out std_logic_vector(7 downto 0);
KEY : IN std_logic_vector(2 downto 0)); ---Button to control the screen color 
end VGA;
architecture VGA_ARCH of VGA is

signal  HCOUNTER: integer:=0; --horizintal counter 
signal  VCOUNTER: integer :=0; -- Vertical counter
Signal  H : std_logic_vector(10-1 downto 0):= "0000000000";
Signal V : std_logic_vector(10-1 downto 0) := "0000000000";
signal clk_25mhz : std_logic; -- 25 MHZ clock signal
begin
VGA_CLK <= clk_25mhz; 
process_clock_25mhz: 
---------  Process to generate the 25 MHZ clock-----------
process (clock_50) 
     begin
	       if reset_n='0' then
            clk_25mhz<= '0';
          elsif rising_edge(clock_50) then
          clk_25mhz <= not clk_25mhz;  -- 25MHZ clock for VGA
          end if;
 end process;
 -------------------- End of 25 MHZ clock process------------
process_sync_screen : 
process (clk_25mhz,KEY) -- Sync Process
  begin
      HC<=H;
		VC<=V;
     if rising_edge(clk_25mhz) then 
       if reset_n = '0' then  -- Async reset
			 H <= (others => '0');
          V <= (others => '0');
			VCOUNTER<=0;
			HCOUNTER<=0;
        Else
-- count h up
        if H >= 799 then
        H <= (others => '0');
		  HCOUNTER<=0;
        else
        H <= H + 1;   -- horizantal counter increment
		  HCOUNTER<=HCOUNTER+1;
        end if;
        if (v >= 524) and (h >= 707) then
            v <= (others => '0');
        elsif h = 707 then
             v <= v + 1;
				VCOUNTER<=VCOUNTER+1; -- Vertical counter
        end if;
        if (H>= 0 AND H <= 639) then
            VGA_BLANK_N <= '1';
        else
            VGA_BLANK_N <= '0';
        end if;
        if (V >= 0 AND V <= 479) then
             VGA_SYNC_N <= '1';
        else
              VGA_SYNC_N <= '0';
        end if;
		   if (H >= 659 AND H <= 755) then
            VGA_HS<= '0';
        else
             VGA_HS<= '1';
        end if;
        if (V>= 493 AND V<= 494) then
             VGA_VS<= '0';
        else
             VGA_VS <= '1';
        end if;
  ------------- Button 1: For red screen color-----------
   if (H < 640 and KEY(0)= '0') then
	       VGA_R <= "11111111";
	       VGA_G <= "00000000";
			 VGA_B <= "00000000";
    end if;
	------------- Button 2: For Blue screen color-----------
    if (H < 640 and KEY(1) = '0') then
          VGA_R <= "00000000";
			 VGA_G <= "11111111";
			 VGA_B <= "00000000";
    end if;
	------------- Button 3: For Green screen color-----------
   if (H < 640 and KEY(2) = '0') then
          VGA_R <= "00000000";
	       VGA_G <= "00000000";
	       VGA_B <= "11111111";
   end if;
  end if;
  end if;
end process process_sync_screen;
end VGA_ARCH;