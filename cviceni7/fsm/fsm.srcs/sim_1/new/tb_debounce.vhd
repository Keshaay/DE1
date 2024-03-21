-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 21.3.2024 16:30:44 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_debounce is
end tb_debounce;

architecture tb of tb_debounce is

    component debounce
        port (clk     : in std_logic;
              rst     : in std_logic;
              en      : in std_logic;
              bouncey : in std_logic;
              clean   : out std_logic;
              pos_edge  :   out std_logic;
              neg_edge  :   out std_logic);
    end component;

    signal clk     : std_logic;
    signal rst     : std_logic;
    signal en      : std_logic;
    signal bouncey : std_logic;
    signal clean   : std_logic;
    signal pos_edge :   std_logic;
    signal neg_edge :   std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';
  
    
begin

    dut : debounce
    port map (clk     => clk,
              rst     => rst,
              en      => en,
              bouncey => bouncey,
              clean   => clean,
              pos_edge => pos_edge,
              neg_edge => neg_edge
              );

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        en <= '1';
        bouncey <= '0';

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        

        -- EDIT Add stimuli here
        wait for 5 * TbPeriod;

        bouncey <= '1';
        wait for 13 ns;
        bouncey <= '0';
        wait for 23 ns;
        
        bouncey <= '1';
        wait for 27 ns;
        bouncey <= '0';
        wait for 31 ns;
        
        bouncey <= '1';
        wait for 20 * TbPeriod;
        
        bouncey <= '0';
        wait for 27 ns;
        bouncey <= '1';
        wait for 31 ns;
        bouncey <= '0';
        wait for 20 * TbPeriod;
         
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_debounce of tb_debounce is
    for tb
    end for;
end cfg_tb_debounce;