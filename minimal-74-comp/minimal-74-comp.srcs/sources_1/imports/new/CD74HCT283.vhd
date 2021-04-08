

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- CD74HCT283 is a standard 4bit adder IC 
-- again, i am defining the inputs/outputs individually to make the transfer 
--to a real circuit easier through RTL 

entity CD74HCT283 is
  Port ( 
        A,B : in Std_Logic_vector(3 downto 0); 
        Y : out Std_Logic_vector(3 downto 0); 
        cin : in std_logic; 
        cout : out Std_logic
  );
end CD74HCT283;

architecture Behavioral of CD74HCT283 is

component FullAdder 
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out STD_LOGIC);
end component;
     
    signal co : std_logic_vector(2 downto 0); 
       
begin

U0: FullAdder port map( x => A(0), y => B(0), cin => cin, s => y(0), cout => co(0)); 
U1: FullAdder port map( x => A(1), y => B(1), cin => co(0), s => y(1), cout => co(1)); 
U2: FullAdder port map( x => A(2), y => B(2), cin => co(1), s => y(2), cout => co(2)); 
U3: FullAdder port map( x => A(3), y => B(3), cin => co(2), s => y(3), cout => cout); 

end Behavioral;
