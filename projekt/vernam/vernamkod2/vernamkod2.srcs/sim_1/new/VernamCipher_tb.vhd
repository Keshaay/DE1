library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Testbench entity
entity VernamCipher_tb is
-- Empty entity as it's a testbench
end VernamCipher_tb;

architecture tb of VernamCipher_tb is
    -- Component declaration of the VernamCipher
    component VernamCipher is
        generic (
            INPUT_TEXT : string := "ahoj"
        );
        Port ( 
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            start : in STD_LOGIC;
            ciphertext_out : out STD_LOGIC_VECTOR (31 downto 0);
            done : out STD_LOGIC
        );
    end component;

    -- Signals for interfacing with the VernamCipher
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    signal start : STD_LOGIC := '0';
    signal ciphertext_out : STD_LOGIC_VECTOR(31 downto 0);
    signal done : STD_LOGIC;

    -- Clock generation
    constant clk_period : time := 10 ns;
    begin
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Instantiate the unit under test (UUT)
    uut: VernamCipher
        generic map (
            INPUT_TEXT => "ahoj"  -- You can change this to test with different inputs
        )
        port map (
            clk => clk,
            rst => rst,
            start => start,
            ciphertext_out => ciphertext_out,
            done => done
        );

    -- Test process
    test : process
    begin
        -- Reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';

        -- Start encryption
        wait for 20 ns;
        start <= '1';
        wait for 10 ns;
        start <= '0';

        -- Wait for encryption to complete
        wait until done = '1';

        -- Check the output
        assert (ciphertext_out /= to_stdlogicvector("Expected Output Here") )
            report "Test failed. Ciphertext does not match expected output."
            severity error;

        -- Stop simulation
        wait;
    end process;
end tb;