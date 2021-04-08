library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--3 to 8 decoder with inverted outputs
entity SN74HCT238 is
  Port (A,E: IN std_logic_vector(2 downto 0);
        Y: out std_logic_vector(7 downto 0)
         );
end SN74HCT238;

architecture Behavioral of SN74HCT238 is
begin
process (E, A) begin
    if(E = "100") then
        case A is
            when "000" => Y <= "00000001";
            when "001" => Y <= "00000010";
            when "010" => Y <= "00000100";
            when "011" => Y <= "00001000";
            when "100" => Y <= "00010000";
            when "101" => Y <= "00100000";
            when "110" => Y <= "01000000";
            when "111" => Y <= "10000000";
            when others => Y <= "00000000";
        end case;
    else
        Y <= "00000000";    
    end if;
end process;
end Behavioral;
