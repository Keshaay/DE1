----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2024 06:06:42 PM
-- Design Name: 
-- Module Name: top_level - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
    Port ( CLK100MHZ : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC;
           BTND : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           LED16_B : out STD_LOGIC;
           LED_LOAD : out STD_LOGIC_VECTOR (3 downto 0));
end top_level;

architecture Behavioral of top_level is

 -- Component declaration for clock enable
    component clock_enable is
        generic (
            PERIOD : integer
        );
        port (
            clk   : in    std_logic;
            rst   : in    std_logic;
            pulse : out   std_logic
        );
    end component;

    -- Component declaration for LFSR counter
    component lfsr is
        generic (
               NBIT : integer := 4
    );
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
          
           load_enable : in STD_LOGIC;
           load_data : in STD_LOGIC_VECTOR (NBIT-1 downto 0);
           done : out std_logic;
           count : out STD_LOGIC_VECTOR (NBIT-1 downto 0)
           );
    end component;

    -- Component declaration for bin2seg
    component bin2seg is
        port (
            clear : in    std_logic;
            bin   : in    std_logic_vector(3 downto 0);
            seg   : out   std_logic_vector(6 downto 0)
        );
    end component;

    -- Local signals for a counter: 4-bit @ 500 ms
    signal sig_en_500ms   : std_logic;                    
    signal sig_count : std_logic_vector(3 downto 0); 
    
begin

-- Component instantiation of clock enable for 500 ms
    lk_en0 : component clock_enable
        generic map (
            PERIOD => 50_000_000
        )
        port map (
            clk   => CLK100MHZ,
            rst   => BTNC,
            pulse => sig_en_500ms
        );

    -- Component instantiation of 4-bit LFSR counter
    lfsr_counter : lfsr
        generic map (
            NBIT => 4
        )
        port map (
            clk   => CLK100MHZ,
            en    => sig_en_500ms,
            load_enable => BTND,
            load_data   => SW,
            done    => LED16_B,
            count   => sig_count
        );

    -- Component instantiation of bin2seg
    display : component bin2seg
        port map (
            clear  => BTNC,
            bin    => sig_count,
            seg(6) => CA,
            seg(5) => CB,
            seg(4) => CC,
            seg(3) => CD,
            seg(2) => CE,
            seg(1) => CF,
            seg(0) => CG
        );

    -- Turn off decimal point
    DP <= '1';

    -- Set display position
    AN <= b"1111_0111";

    -- Set output LEDs (green)
    LED_LOAD <= SW;
    LED <= sig_count;

end Behavioral;
