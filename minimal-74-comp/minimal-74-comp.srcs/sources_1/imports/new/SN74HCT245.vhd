library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



--SN74HCT254 OCTAL BUS TRANCIEVER WITH 3 STATE OUTPUT
--once again defined with each pin as a different signal to assist in netlist transfer 
entity SN74HCT245 is
  Port (
        a,b : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        DIR, OE : IN std_logic
   );
end SN74HCT245;

architecture Behavioral of SN74HCT245 is

begin

process(dir, OE) begin
    if(oe = '1') then
          A <= "ZZZZZZZZ";
          b <= "ZZZZZZZZ";
    else
        if dir = '0' then
          a <= b;
        else
          b <= A;
        end if;
    end if;   
end process;
end Behavioral;
