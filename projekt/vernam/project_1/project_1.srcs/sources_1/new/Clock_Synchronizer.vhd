library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Clock_Synchronizer is
    Port (
        clock_in  : in  std_logic;  -- vstupní signál hodin
        reset_in  : in  std_logic;  -- signál resetu
        clock_out : out std_logic   -- synchronizovaný výstupní signál hodin
    );
end Clock_Synchronizer;

architecture Behavioral of Clock_Synchronizer is
    signal sync_clock : std_logic := '0';  -- interní synchronizovaný signál hodin
begin
    process (clock_in, reset_in)
    begin
        if reset_in = '1' then
            sync_clock <= '0';  -- resetujte synchronizovaný signál hodin
        elsif rising_edge(clock_in) then
            sync_clock <= not sync_clock;  -- inverze synchronizovaného signálu hodin na každém nábìžném hranì vstupních hodin
        end if;
    end process;

    clock_out <= sync_clock;  -- výstupní signál je synchronizovaný signál hodin
end Behavioral;
