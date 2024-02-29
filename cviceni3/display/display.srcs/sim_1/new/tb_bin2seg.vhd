-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 22.2.2024 16:25:50 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_bin2seg is
end tb_bin2seg;

architecture tb of tb_bin2seg is

    component bin2seg
        port (clear : in std_logic;
              bin   : in std_logic_vector (3 downto 0);
              seg   : out std_logic_vector (6 downto 0));
    end component;

    signal clear : std_logic;
    signal bin   : std_logic_vector (3 downto 0);
    signal seg   : std_logic_vector (6 downto 0);

begin

    dut : bin2seg
    port map (clear => clear,
              bin   => bin,
              seg   => seg);

    stimuli : process
    begin
    
    -- Disable clear
clear <= '0';

-- Test case 1: Input binary value 0000
bin <= x"0";
wait for 50 ns;
assert seg = "0000001"
  report "0 does not map to 0000001"
  severity error;

-- Test case 1: Input binary value 0000
bin <= x"1";
wait for 50 ns;
assert seg = "1001111"
  report "1 does not map to 1001111"
  severity error;


-- Test case 1: Input binary value 0000
bin <= x"2";
wait for 50 ns;
assert seg = "0010010"
  report "2 does not map to 0010010"
  severity error;
        -- EDIT Adapt initialization as needed
        clear <= '0';
        bin <= (others => '0');
        
-- Test case 1: Input binary value 0000
bin <= x"3";
wait for 50 ns;
assert seg = "0000110"
  report "3 does not map to 0000110"
  severity error;
  
  bin <= x"4";
wait for 50 ns;
assert seg = "1001100"
  report "4 does not map to 1001100"
  severity error;
  
  bin <= x"5";
wait for 50 ns;
assert seg = "0100100"
  report "5 does not map to 0100100"
  severity error;
  
  bin <= x"6";
wait for 50 ns;
assert seg = "0100000"
  report "6 does not map to 0100000"
  severity error;
  
    bin <= x"7";
wait for 50 ns;
assert seg = "0001111"
  report "7 does not map to 0001111"
  severity error;
  
    bin <= x"8";
wait for 50 ns;
assert seg = "0000000"
  report "8 does not map to 0000000"
  severity error;
  
    bin <= x"9";
wait for 50 ns;
assert seg = "00000100"
  report "9 does not map to 0000100"
  severity error;
  
    bin <= x"A";
wait for 50 ns;
assert seg = "0001000"
  report "A does not map to 0001000"
  severity error;
  
   
 

        wait;
    end process;

end tb;