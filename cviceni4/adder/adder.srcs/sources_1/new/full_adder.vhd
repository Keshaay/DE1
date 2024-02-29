----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2024 05:06:56 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port ( c_in : in STD_LOGIC;
           b : in STD_LOGIC;
           a : in STD_LOGIC;
           c_out : out STD_LOGIC;
           sum : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

begin

sum <= c_in xor (b xor a);
c_out <= (b and a) or (c_in and (b xor a)); 

end Behavioral;
