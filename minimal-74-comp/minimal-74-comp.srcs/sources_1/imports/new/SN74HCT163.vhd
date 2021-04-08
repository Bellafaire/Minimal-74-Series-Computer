library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--parallel load 4 bit counter
--MR master reset
-- CP clock input
-- D data input
-- PE paralel enable input (active low)
-- CET count enable carry input
-- TC terminal count output
-- cep count enable input 
entity SN74HCT163 is
  Port ( 
        MR, CP, CEP, CET, PE : in std_logic;
        D : in std_logic_vector(3 downto 0);
        TC : out std_logic;
        Q : out std_logic_vector(3 downto 0)  
  );
end SN74HCT163;

architecture Behavioral of SN74HCT163 is

signal Q0 : std_logic_vector(3 downto 0); 

begin

process( MR, CP, CEP, CET, PE, D, Q0) begin
  if( MR = '0' ) then
    Q0 <= "0000";
  else
    if( CP'event and CP = '1') then
        TC <= '0';
        if PE = '0' then
            Q0 <= D;
        elsif CEP = '1' then
            case Q0 is
                when "0000" => Q0 <= "0001";
                when "0001" => Q0 <= "0010";
                when "0010" => Q0 <= "0011";
                when "0011" => Q0 <= "0100";
                when "0100" => Q0 <= "0101";
                when "0101" => Q0 <= "0110";
                when "0110" => Q0 <= "0111";
                when "0111" => Q0 <= "1000";
                when "1000" => Q0 <= "1001";
                when "1001" => Q0 <= "1010";
                when "1010" => Q0 <= "1011";
                when "1011" => Q0 <= "1100";
                when "1100" => Q0 <= "1101";
                when "1101" => Q0 <= "1110";
                when "1110" => Q0 <= "1111";
                when "1111" => Q0 <= "0000"; if (CET = '1') then TC <= '1'; end if;
            end case;          
        end if;    
    end if;  
  end if;
end process;
end Behavioral;
