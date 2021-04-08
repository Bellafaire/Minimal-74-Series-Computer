library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SN74HCT08 is
   Port ( 
   A, B : in std_logic_vector(3 downto 0);
    Y : out std_logic_vector(3 downto 0)      
   );
end SN74HCT08;

architecture Behavioral of SN74HCT08 is

begin

y <= a and b;

end Behavioral;
