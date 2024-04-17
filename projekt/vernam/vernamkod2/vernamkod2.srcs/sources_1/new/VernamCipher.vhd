library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration for the encryption system
entity EncryptionSystem is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           start : in STD_LOGIC;
           plaintext_in : in STD_LOGIC_VECTOR (31 downto 0);
           ciphertext_out : out STD_LOGIC_VECTOR (31 downto 0);
           done : out STD_LOGIC);
end EncryptionSystem;

architecture Behavioral of EncryptionSystem is
    -- Internal signals
    signal random_key : STD_LOGIC_VECTOR (31 downto 0);
    signal encrypt_enable : STD_LOGIC;
    signal lfsr : STD_LOGIC_VECTOR(31 downto 0) := x"12345678"; -- Initial seed for LFSR

begin
    -- Random key generator (LFSR)
    key_gen_process: process(clk, rst)
    begin
        if rst = '1' then
            lfsr <= x"12345678";  -- Reset to initial seed
        elsif rising_edge(clk) then
            if encrypt_enable = '1' then
                -- Fibonacci LFSR feedback polynomial: x^32 + x^22 + x^2 + x^1 + 1
                lfsr(31 downto 1) <= lfsr(30 downto 0);
                lfsr(0) <= lfsr(31) xor lfsr(21) xor lfsr(1) xor lfsr(0);
            end if;
        end if;
    end process;
    random_key <= lfsr; -- Output the current state of LFSR as the random key

    -- Encryption process
    encryption_process: process(clk, rst)
    begin
        if rst = '1' then
            ciphertext_out <= (others => '0');
            done <= '0';
            encrypt_enable <= '0';
        elsif rising_edge(clk) then
            if start = '1' then
                encrypt_enable <= '1';
                ciphertext_out <= plaintext_in XOR random_key;
                done <= '1';
            else
                encrypt_enable <= '0';
                done <= '0';
            end if;
        end if;
    end process;

end Behavioral;