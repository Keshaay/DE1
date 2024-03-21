----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2024 06:09:22 PM
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
           BTNC : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           LED16_B : out STD_LOGIC);
end top_level;

architecture Behavioral of top_level is

component debounce is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           bouncey : in STD_LOGIC;
           clean : out STD_LOGIC;
           pos_edge : out  std_logic;
           neg_edge : out  std_logic);
end component;

-- Component declaration for clock enable
    component clock_enable is
        generic (
            PERIOD : integer
        );
        port (
            clk   : in    std_logic;
            rst   : in    std_logic;
            pulse : out   std_logic
        );
    end component;
    
    -- Component declaration for simple counter
        component simple_counter
         generic (
            NBIT : integer := 4
            );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (NBIT-1 downto 0));
           end component; 

signal sig_en_2ms   : std_logic; 
signal sig_event    : std_logic;    

begin

      -- Component instantiation of clock enable for 2 ms
    clk_en1 : component clock_enable
        generic map (
            PERIOD => 200_000
        )
        port map (
            clk   => CLK100MHZ,
            rst   => BTNC,
            pulse => sig_en_2ms
        );

     -- Component instantiation of 4-bit simple counter
        counter0 : component simple_counter
            generic map (
                NBIT => 4
            )
            port map (
                clk   => CLK100MHZ,
                rst   => BTNC,
                en    => sig_event,
                count => LED
            );
            
     debouncer  :  debounce
     
     port map (
     
            clk  => CLK100MHZ,
            rst   => BTNC,
            bouncey   => BTNR,
            en => sig_en_2ms,
            pos_edge => open, --zmena pos a neg
            neg_edge => sig_event,
            clean => LED16_B
        );

end Behavioral;
