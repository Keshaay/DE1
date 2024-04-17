library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use std.env.all;
use std.standard.all;

use std.textio.all;


entity test_tb is
end test_tb;

architecture Behavioral of test_tb is




constant txt : string := "melicharova";
constant shift: integer :=5;
shared variable encrypted:string(txt'range);
shared variable decrypted:string(txt'range);
  

 
procedure ceasar_encrypt(str:string) is
    variable encrypted_char : character;
    variable tmp : integer;
    variable atbash_alphabet : string(1 to 26); -- Abeceda Atbash Cipher
begin
    -- Naètení abecedy Atbash Cipher z externího souboru alphabet
    file alphabet_file : text;
    variable line : line;
begin
    file_open(alphabet_file, "alphabet", read_mode);
    for i in atbash_alphabet'range loop
        readline(alphabet_file, line);
        read(line, atbash_alphabet(i));
    end loop;
    file_close(alphabet_file);
end;

begin
    for i in str'range loop
        -- Nalezení odpovídajícího znaku v abecedì Atbash Cipher
        for j in atbash_alphabet'range loop
            if str(i) = atbash_alphabet(j) then
                -- Výpoèet posunutého indexu znaku
                tmp := (j + shift) mod 26;
                if tmp = 0 then
                    tmp := 26;
                end if;
                -- Nalezení šifrovaného znaku v abecedì Atbash Cipher
                encrypted_char := atbash_alphabet(tmp);
                -- Uložení šifrovaného znaku do výstupu
                encrypted(i) := encrypted_char;
                exit;
            end if;
        end loop;
    end loop;
    report "Encrypted text is: " & encrypted;
end procedure;





procedure ceasar_decrypt(str:string) is
 variable decrypted_char :character;
     variable tmp:integer;   
    begin
    
         for i in str'range loop
        tmp := character'pos(str(i))-shift;
        decrypted_char:=character'val(tmp);
       -- report character'image(decrypted_char);
        decrypted(i):=decrypted_char;
     end loop;
    report "Decrypted text is :" & decrypted;
end procedure;





begin



 ceasar_decrypt(encrypted);
 ceasar_encrypt(txt);

 

end Behavioral;