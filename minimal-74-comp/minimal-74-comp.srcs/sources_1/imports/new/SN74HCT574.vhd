library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--all inputs in this project are defined as std_logic externally so that the final RTL schematic 
--is easy to move into a physical model 

--SN74HCT574 -octal edge-triggered D-type Flip-Flops with 3 state output

--this file will be the standard register for almost all data

entity SN74HCT574 is
  Port (
    OE, CLK : in std_logic; 
    D: in std_logic_vector(7 downto 0); 
    Q: out std_logic_vector(7 downto 0)  
   );
end SN74HCT574;
architecture Behavioral of SN74HCT574 is

signal Qout : STD_LOGIC_VECTOR(7 downto 0); 

begin
process(OE, CLK, D) begin
    if(OE = '1') then
        Qout <= "ZZZZZZZZ"; 
    else 
        if(clk'event and clk ='1') then
            Qout <= D;
        end if; 
    end if;
end process;
q <= qout;
end Behavioral;
