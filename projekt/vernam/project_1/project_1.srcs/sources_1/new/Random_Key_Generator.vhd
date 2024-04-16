library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity Random_Key_Generator is
    generic (
        N: integer := 8  -- d�lka kl��e v bitech
    );
    port (
        clock : in  std_logic;                     -- hodiny
        reset : in  std_logic;                     -- reset sign�l
        key   : out std_logic_vector(N-1 downto 0) -- v�stupn� kl��
    );
end Random_Key_Generator;

architecture Behavioral of Random_Key_Generator is
    signal rand_num : std_logic_vector(N-1 downto 0);
begin
    process(clock, reset)
    begin
        if reset = '1' then
            rand_num <= (others => '0');  -- resetujte gener�tor
        elsif rising_edge(clock) then
            -- Generujte n�hodn� ��slo
            rand_num <= rand_num + 1;
        end if;
    end process;

    key <= rand_num;
end Behavioral;
