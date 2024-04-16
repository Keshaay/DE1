-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 13.4.2024 20:37:29 UTC

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Random_Key_Generator is
end tb_Random_Key_Generator;

architecture tb of tb_Random_Key_Generator is

    component Random_Key_Generator
    
    generic (
            N : integer
        );
        
        port (clock : in std_logic;
              reset : in std_logic;
              key   : out std_logic_vector (N-1 downto 0));
    end component;

    constant C_N    : integer := 8;
    signal clock : std_logic;
    signal reset : std_logic;
    signal key   : std_logic_vector (C_N-1 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : Random_Key_Generator
    
    generic map (
            N => C_N
        )
        
    port map (clock => clock,
              reset => reset,
              key   => key);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clock is really your main clock signal
    clock <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- Reset generation
        -- EDIT: Check that reset is really your reset signal
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;
        reset <= '1';
        wait for 100 ns;
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;
        

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_Random_Key_Generator of tb_Random_Key_Generator is
    for tb
    end for;
end cfg_tb_Random_Key_Generator;