library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--3 to 8 decoder with inverted outputs
entity SN74HCT138 is
  Port (A,E: IN std_logic_vector(2 downto 0);
        Y: out std_logic_vector(7 downto 0)
         );
end SN74HCT138;

architecture Behavioral of SN74HCT138 is
begin
process (E, A) begin
    if(E = "100") then
        case A is
            when "000" => Y <= "11111110";
            when "001" => Y <= "11111101";
            when "010" => Y <= "11111011";
            when "011" => Y <= "11110111";
            when "100" => Y <= "11101111";
            when "101" => Y <= "11011111";
            when "110" => Y <= "10111111";
            when "111" => Y <= "01111111";
            when others => Y <= "00000000";
        end case;
    else
        Y <= "11111111";    
    end if;
end process;
end Behavioral;
