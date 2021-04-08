library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SN74HCT32 is
  Port (
        A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
end SN74HCT32;

architecture Behavioral of SN74HCT32 is

begin

Y <= A OR B;

end Behavioral;
