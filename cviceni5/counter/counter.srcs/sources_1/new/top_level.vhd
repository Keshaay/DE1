----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2024 06:32:58 PM
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
    Port ( CLK100MHZ : in STD_LOGIC;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC);
end top_level;

architecture Behavioral of top_level is

    -- Component declaration for clock enable
    component clock_enable
         generic (
        PERIOD : integer := 6
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pulse : out STD_LOGIC);

end component;


    -- Component declaration for simple counter
        component simple_counter
         generic (
            N : integer := 4
            );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (N-1 downto 0));
           end component; 

    -- Component declaration for bin2seg
        component bin2seg

    Port ( clear : in STD_LOGIC;
           bin : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0)
           );
    end component;

    -- Local signals for a counter: 4-bit @ 250 ms

begin

    -- Component instantiation of clock enable for 250 ms

			

    -- Component instantiation of 4-bit simple counter


    -- Component instantiation of bin2seg
    display : bin2seg
    
    port map (
    clear   => BTNC,
    bin     =>  sig_count_4bit,
    seg(6)  => CA,
    seg(5)  => CB,
    seg(4)  => CC,
    seg(3)  => CD,
    seg(2)  => CE,
    seg(1)  => CF,
    seg(0)  => CG
    );

    -- Turn off decimal point
    DP <= '1';

    -- Set display position
    AN <= "1111_1110";

end Behavioral;
