----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2024 05:52:20 PM
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
    Port ( SW_B : in STD_LOGIC_VECTOR (3 downto 0);
           SW_A : in STD_LOGIC_VECTOR (3 downto 0);
           LED_B : out STD_LOGIC_VECTOR (3 downto 0);
           LED_A : out STD_LOGIC_VECTOR (3 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC;
           LED_RED : out STD_LOGIC);
end top_level;

architecture Behavioral of top_level is

-- Component declaration for 4-bit adder
    component adder_4bit
        port (c_in   : in std_logic;
              b      : in std_logic_vector (3 downto 0);
              a      : in std_logic_vector (3 downto 0);
              c_out  : out std_logic;
              result : out std_logic_vector (3 downto 0));
    end component;
     

  -- Component declaration for bin2seg
    component bin2seg
    


    Port ( clear : in STD_LOGIC;
           bin : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0)
    );
    end component;

  -- Local signal for adder result
    signal sig_tmp : std_logic_vector (3 downto 0);
  
begin

 -- Component instantiation of 4-bit adder
        alu : adder_4bit

    port map (
       c_in     => '0',
       b        => SW_B,
       a        =>  SW_A,
       c_out    =>LED_RED,
       result   =>  sig_tmp
    );

  -- Component instantiation of bin2seg
    display : bin2seg
    
    port map (
    clear   => BTNC,
    bin     =>  sig_tmp,
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


  -- Display input values on LEDs
    LED_A <= SW_A;
    LED_B <= SW_B;
  

  -- Set display position
    AN <= b"1111_1110";

end Behavioral;
