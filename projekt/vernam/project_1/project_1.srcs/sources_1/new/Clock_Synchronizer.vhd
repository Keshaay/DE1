library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Clock_Synchronizer is
    Port (
        clock_in  : in  std_logic;  -- vstupn� sign�l hodin
        reset_in  : in  std_logic;  -- sign�l resetu
        clock_out : out std_logic   -- synchronizovan� v�stupn� sign�l hodin
    );
end Clock_Synchronizer;

architecture Behavioral of Clock_Synchronizer is
    signal sync_clock : std_logic := '0';  -- intern� synchronizovan� sign�l hodin
begin
    process (clock_in, reset_in)
    begin
        if reset_in = '1' then
            sync_clock <= '0';  -- resetujte synchronizovan� sign�l hodin
        elsif rising_edge(clock_in) then
            sync_clock <= not sync_clock;  -- inverze synchronizovan�ho sign�lu hodin na ka�d�m n�b�n�m hran� vstupn�ch hodin
        end if;
    end process;

    clock_out <= sync_clock;  -- v�stupn� sign�l je synchronizovan� sign�l hodin
end Behavioral;
