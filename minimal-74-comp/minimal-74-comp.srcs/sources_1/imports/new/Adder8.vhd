----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2019 07:40:22 PM
-- Design Name: 
-- Module Name: Adder8 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder8 is
    Port ( A,B : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR(7 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC);
end Adder8;

architecture Behavioral of Adder8 is
component CD74HCT283 is
    port(
       A,B : in Std_Logic_vector(3 downto 0); 
       Y : out Std_Logic_vector(3 downto 0); 
       cin : in std_logic; 
       cout : out Std_logic
    );   
end component;

signal adder1Cout : std_logic;

begin

adderLower: CD74HCT283 port map(A => A(3 downto 0), B => B(3 downto 0), Y => Y(3 downto 0), cin => cin, cout => adder1Cout);
adderUpper: CD74HCT283 port map(A => A(7 downto 4), B => B(7 downto 4), Y => Y(7 downto 4), cin => adder1Cout, cout => cout);

end Behavioral;
