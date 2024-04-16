----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 22:02:15
-- Design Name: 
-- Module Name: vernam1 - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity vernam1 is

generic (
        N : integer := 8 --! Number of bits
    );
    
    Port (
        message : in  std_logic_vector(N-1 downto 0); -- vstupní zpráva k zašifrování/dešifrování
        key     : in  std_logic_vector(N-1 downto 0); -- klíè
        output  : out std_logic_vector(N-1 downto 0)  -- výstupní zašifrovaná/dešifrovaná zpráva
    );
end entity vernam1;

architecture Behavioral of vernam1 is

begin
    process(message, key)
    begin
        -- Pro každý bit ve zprávì a klíèi provedeme XOR operaci
        for i in message'range loop
            output(i) <= message(i) xor key(i);
        end loop;
    end process;
end Behavioral;
