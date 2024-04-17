-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 17.4.2024 18:03:04 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_EncryptionSystem is
end tb_EncryptionSystem;

architecture tb of tb_EncryptionSystem is

    component EncryptionSystem
        port (clk            : in std_logic;
              rst            : in std_logic;
              start          : in std_logic;
              plaintext_in   : in std_logic_vector (31 downto 0);
              ciphertext_out : out std_logic_vector (31 downto 0);
              done           : out std_logic);
    end component;

    signal clk            : std_logic;
    signal rst            : std_logic;
    signal start          : std_logic;
    signal plaintext_in   : std_logic_vector (31 downto 0);
    signal ciphertext_out : std_logic_vector (31 downto 0);
    signal done           : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : EncryptionSystem
    port map (clk            => clk,
              rst            => rst,
              start          => start,
              plaintext_in   => plaintext_in,
              ciphertext_out => ciphertext_out,
              done           => done);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        start <= '0';
        plaintext_in <= (others => '0');

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_EncryptionSystem of tb_EncryptionSystem is
    for tb
    end for;
end cfg_tb_EncryptionSystem;