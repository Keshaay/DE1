----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2024 05:30:54 PM
-- Design Name: 
-- Module Name: adder_4bit - Behavioral
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

entity adder_4bit is
    Port ( c_in : in STD_LOGIC;
           b : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (3 downto 0);
           c_out : out STD_LOGIC;
           result : out STD_LOGIC_VECTOR (3 downto 0));
end adder_4bit;

architecture Behavioral of adder_4bit is

component full_adder is
    port (
      c_in  : in    std_logic;
      b     : in    std_logic;
      a     : in    std_logic;
      c_out : out   std_logic;
      sum   : out   std_logic
    );
  end component;

  -- Local signals for carry propagation
  signal sig_c0 : std_logic;
  signal sig_c1 : std_logic;
  signal sig_c2 : std_logic;

begin

-- Component instantiations for each bit position
  -- 1st full adder
  FA0 : full_adder
    port map (
      c_in  => c_in,
      b     => b(0),
      a     => a(0),
      c_out => sig_c0,
      sum   => result(0)
    );

  -- 2nd full adder
  FA2 : full_adder
    port map (
      c_in  => c_in,
      b     => b(1),
      a     => a(1),
      c_out => sig_c0,
      sum   => result(1)
    );

  -- 3rd full adder
 FA3 : full_adder
    port map (
      c_in  => c_in,
      b     => b(2),
      a     => a(2),
      c_out => sig_c0,
      sum   => result(2)
    );

  -- 4th full adder
 FA4 : full_adder
    port map (
      c_in  => c_in,
      b     => b(3),
      a     => a(3),
      c_out => sig_c0,
      sum   => result(3)
    );

end Behavioral;
