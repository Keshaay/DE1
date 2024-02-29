-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 29.2.2024 16:12:12 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder is
end tb_full_adder;

architecture tb of tb_full_adder is

    component full_adder
        port (c_in  : in std_logic;
              b     : in std_logic;
              a     : in std_logic;
              c_out : out std_logic;
              sum   : out std_logic);
    end component;

    signal c_in  : std_logic;
    signal b     : std_logic;
    signal a     : std_logic;
    signal c_out : std_logic;
    signal sum   : std_logic;

begin

    dut : full_adder
    port map (c_in  => c_in,
              b     => b,
              a     => a,
              c_out => c_out,
              sum   => sum);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        c_in <= '0';
        b <= '0';
        a <= '0';
        
        wait for 100 ns;
assert (c_out = '0' and sum = '0')
  report "Input combination c_in=0, b=0, a=0 FAILED"
  severity error;
  
   c_in <= '0';
        b <= '0';
        a <= '1';
        
        wait for 100 ns;
assert (c_out = '0' and sum = '1')
  report "Input combination c_in=0, b=0, a=0 FAILED"
  severity error;
  
  c_in <= '0';
        b <= '1';
        a <= '0';
        
        wait for 100 ns;
assert (c_out = '0' and sum = '1')
  report "Input combination c_in=0, b=0, a=0 FAILED"
  severity error;
  
  c_in <= '0';
        b <= '1';
        a <= '1';
        
        wait for 100 ns;
assert (c_out = '1' and sum = '0')
  report "Input combination c_in=0, b=0, a=0 FAILED"
  severity error;
  
  c_in <= '1';
        b <= '0';
        a <= '0';
        
        wait for 100 ns;
assert (c_out = '0' and sum = '1')
  report "Input combination c_in=0, b=0, a=0 FAILED"
  severity error;
  
  c_in <= '1';
        b <= '0';
        a <= '1';
        
        wait for 100 ns;
assert (c_out = '1' and sum = '0')
  report "Input combination c_in=0, b=0, a=0 FAILED"
  severity error;
  
  c_in <= '1';
        b <= '1';
        a <= '0';
        
        wait for 100 ns;
assert (c_out = '1' and sum = '0')
  report "Input combination c_in=0, b=0, a=0 FAILED"
  severity error;
  
  c_in <= '1';
        b <= '1';
        a <= '1';
        
        wait for 100 ns;
assert (c_out = '1' and sum = '1')
  report "Input combination c_in=0, b=0, a=0 FAILED"
  severity error;
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_full_adder of tb_full_adder is
    for tb
    end for;
end cfg_tb_full_adder;