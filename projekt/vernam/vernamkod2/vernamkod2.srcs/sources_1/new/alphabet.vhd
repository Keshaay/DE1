entity Atbash_Cipher is
    Port (
        input_char : in  character;  -- Vstupní znak k šifrování
        output_char : out character   -- Vıstupní šifrovanı znak
    );
end Atbash_Cipher;

architecture Behavioral of Atbash_Cipher is
begin
    process(input_char)
    begin
        case input_char is
            when 'A' =>
                output_char <= 'Z';
            when 'B' =>
                output_char <= 'Y';
            when 'C' =>
                output_char <= 'X';
            when 'D' =>
                output_char <= 'W';
            when 'E' =>
                output_char <= 'V';
            when 'F' =>
                output_char <= 'U';
            when 'G' =>
                output_char <= 'T';
            when 'H' =>
                output_char <= 'S';
            when 'I' =>
                output_char <= 'R';
            when 'J' =>
                output_char <= 'Q';
            when 'K' =>
                output_char <= 'P';
            when 'L' =>
                output_char <= 'O';
            when 'M' =>
                output_char <= 'N';
            when 'N' =>
                output_char <= 'M';
            when 'O' =>
                output_char <= 'L';
            when 'P' =>
                output_char <= 'K';
            when 'Q' =>
                output_char <= 'J';
            when 'R' =>
                output_char <= 'I';
            when 'S' =>
                output_char <= 'H';
            when 'T' =>
                output_char <= 'G';
            when 'U' =>
                output_char <= 'F';
            when 'V' =>
                output_char <= 'E';
            when 'W' =>
                output_char <= 'D';
            when 'X' =>
                output_char <= 'C';
            when 'Y' =>
                output_char <= 'B';
            when 'Z' =>
                output_char <= 'A';
            when others =>
                output_char <= input_char;  -- Nezmìòujte jiné znaky
        end case;
    end process;
end Behavioral;