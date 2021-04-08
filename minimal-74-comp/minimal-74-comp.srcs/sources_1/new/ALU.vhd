library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (8 downto 0);
           B : in STD_LOGIC_VECTOR (8 downto 0);
           cout : out STD_LOGIC;
            E : in std_logic; 
           op : in STD_LOGIC_VECTOR (2 downto 0);
           output: out STD_LOGIC_VECTOR(8 downto 0));
end ALU;

architecture Behavioral of ALU is

component Adder8 is
    Port ( A,B : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR(7 downto 0); 
           cin : in STD_LOGIC;
           cout : out STD_LOGIC);
end component;

component SN74HCT245 is
  Port (
        a,b : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        DIR, OE : IN std_logic
   );
end component;

component SN74HCT238 is
  Port (A,E: IN std_logic_vector(2 downto 0);
        Y: out std_logic_vector(7 downto 0)
         );
end component;

signal AdderOut : std_logic_vector(7 downto 0); 
signal decoderOut : std_logic_vector(8 downto 0);
signal decoderEnable: std_logic_vector(2 downto 0);
signal outputBus : std_logic_vector(7 downto 0); 
begin

--decoder
decoderEnable <= E & "00";
opDecoder: SN74HCT238 port map(E => decoderEnable, A => op,Y => decoderOut); 

Adder: Adder8 port map(A => A, B => B, Y => AdderOut, cin => '0', cout => cout);
AdderBusInterface: SN74HCT245 port map(A => adderout, b => outputBus, dir => '1', OE => decoderOut(0));

output <= outputBus;
end Behavioral;
