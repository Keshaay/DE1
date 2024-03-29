----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2024 05:34:24 PM
-- Design Name: 
-- Module Name: compare_2bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compare_2bit is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           b_greater : out STD_LOGIC;
           b_a_equal : out STD_LOGIC;
           a_greater : out STD_LOGIC);
end compare_2bit;

architecture Behavioral of compare_2bit is

begin
    b_greater <= (b(1) and (a(1)))or
    (b(0) and not(a(1)) and not(a(0))) or 
    (b(1) and b(0) and not (a(0)));

    b_a_equal <= '1' when (b = a) else
                 '0';
                 
    a_greater <= '1' when (b < a) else
                 '0';        
                 
end Behavioral;
