-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 29.2.2024 16:39:51 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_adder_4bit is
end tb_adder_4bit;

architecture tb of tb_adder_4bit is

    component adder_4bit
        port (c_in   : in std_logic;
              b      : in std_logic_vector (3 downto 0);
              a      : in std_logic_vector (3 downto 0);
              c_out  : out std_logic;
              result : out std_logic_vector (3 downto 0));
    end component;

    signal c_in   : std_logic;
    signal b      : std_logic_vector (3 downto 0);
    signal a      : std_logic_vector (3 downto 0);
    signal c_out  : std_logic;
    signal result : std_logic_vector (3 downto 0);

begin

    dut : adder_4bit
    port map (c_in   => c_in,
              b      => b,
              a      => a,
              c_out  => c_out,
              result => result);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        c_in <= '0';
        b <= (others => '0');
        a <= (others => '0');

        c_in <= '0';
        b <= (others => '1');
        a <= (others => '0');
        
        c_in <= '1';
        b <= (others => '0');
        a <= (others => '1');
        
        c_in <= '1';
        b <= (others => '1');
        a <= (others => '1');
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_adder_4bit of tb_adder_4bit is
    for tb
    end for;
end cfg_tb_adder_4bit;