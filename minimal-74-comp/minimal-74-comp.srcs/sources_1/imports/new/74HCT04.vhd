
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SN74HCT04 is
    Port ( A : in STD_LOGIC_VECTOR(5 DOWNTO 0);
           y : out STD_LOGIC_VECTOR(5 DOWNTO 0));
end SN74HCT04;

architecture Behavioral of SN74HCT04 is
begin

Y <= NOT A;

end Behavioral;
