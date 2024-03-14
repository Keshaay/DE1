-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 14.3.2024 16:20:19 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_lfsr is
end tb_lfsr;

architecture tb of tb_lfsr is

    component lfsr
    
    generic (
        NBIT : integer 
    );
    
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           load_enable : in STD_LOGIC;
           load_data : in STD_LOGIC_VECTOR (NBIT-1 downto 0);
           done : out std_logic;
           count : out STD_LOGIC_VECTOR (NBIT-1 downto 0)
           );
    end component;

    constant C_NBIT : integer := 3;
    signal clk         : std_logic;
    signal en          : std_logic;
    signal load_enable : std_logic;
    signal load_data   : std_logic_vector (C_NBIT-1 downto 0);
    signal done        : std_logic;
    signal count       : std_logic_vector (C_NBIT-1 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : lfsr
    generic map (
    
    NBIT => C_NBIT
    
    )
    
    port map (clk         => clk,
              en          => en,
              load_enable => load_enable,
              load_data   => load_data,
              done        => done,
              count       => count);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        en <= '1';
        load_enable <= '1';
        load_data <= (others => '0');
            wait for 3 * TbPeriod;
        load_enable <= '0';
        -- EDIT Add stimuli here
        wait for 77 * TbPeriod;
        en <= '0';
        wait for 22 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_lfsr of tb_lfsr is
    for tb
    end for;
end cfg_tb_lfsr;