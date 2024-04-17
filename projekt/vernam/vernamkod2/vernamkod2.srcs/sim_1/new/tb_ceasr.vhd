library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Atbash_Cipher_Testbench is
end Atbash_Cipher_Testbench;

architecture Behavioral of Atbash_Cipher_Testbench is

  constant clk_period : constant time := 10 ns; -- Clock period (adjust as needed)

  signal clk : STD_LOGIC;
  signal reset : STD_LOGIC;
  signal data_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
  signal mode : STD_LOGIC;
  signal data_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
  signal ready : STD_LOGIC;
  signal busy : STD_LOGIC;

  constant test_cases : constant array(0 to 7) of character :=
    ('a', 'h', 'o', 'j', 'Z', 'y', 'X', '?');

begin

  -- Clock generator
  process
  begin
    clk <= not clk;
    wait for clk_period / 2;
  end process;

  -- Reset signal generator
  reset <= '1';
  after 100 ns;
  reset <= '0';
  after 100 ns;

  -- Test cases loop
  for i in test_cases'range loop
    data_in <= character'to_integer(test_cases(i));
    mode <= '0'; -- Encryption
    wait for 50 ns; -- Allow for processing
    assert data_out = atbash_encrypt(test_cases(i)) report "Encryption failed for " & test_cases(i) & " (" & character'image(data_out) & ")";

    mode <= '1'; -- Decryption
    wait for 50 ns; -- Allow for processing
    assert data_out = test_cases(i) report "Decryption failed for " & character'image(data_out) & " (" & character'image(data_out) & ")";
  end loop;

end Behavioral;