library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration (specifies interface)
entity Cipher is
  port (
    clk : in std_logic;
    reset : in std_logic;
    -- Input buttons/switches for plaintext
    data_in : in std_logic_vector(7 downto 0);  -- Assuming 8-bit ASCII characters
    data_valid : in std_logic;                -- Indicates valid input
    start : in std_logic;                     -- Start encryption/decryption
    -- Output LEDs for status
    ready : out std_logic;
    busy : out std_logic;
    done : out std_logic;
    -- 7-segment display for output
    segment_data : out std_logic_vector(7 downto 0)
  );
end entity Cipher;

-- Architecture implementation (defines functionality)
architecture Behavioral of Cipher is
  -- Signals for internal logic
  type CipherState is (Idle, Input, Processing, Done);
  signal state : CipherState := Idle;
  signal plaintext : std_logic_vector(7 downto 0);
  -- ... other internal signals based on chosen ciphers

begin

  -- Process for state control and button/switch handling
  process(clk, reset)
  begin
    if reset = '1' then
      state <= Idle;
    elsif rising_edge(clk) then
      case state is
        when Idle =>
          if data_valid = '1' then
            plaintext <= data_in;
            state <= Input;
          end if;
        when Input =>
          if start = '1' then
            state <= Processing;
          end if;
        when Processing =>
          -- Implement cipher logic here (encryption/decryption)
          -- Update internal signals, generate ciphertext
          state <= Done;
        when Done =>
          -- Display ciphertext on 7-segment display
          -- ...
          state <= Idle;
      end case;
    end if;
  end process;

  -- Processes for handling LEDs and 7-segment display (based on state)
  -- ... additional processes for specific cipher logic

end architecture Behavioral;