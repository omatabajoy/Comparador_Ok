library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Comparador is
    port (
        num1 : in std_logic_vector(3 downto 0);
        num2 : in std_logic_vector(3 downto 0);
        display1: out std_logic_vector(6 downto 0);
        display2: out std_logic_vector(6 downto 0)
    );
end entity Comparador;

architecture arch_Comparador of Comparador is

    signal resultado : std_logic_vector(3 downto 0);
	 signal salida : std_logic;
	 
    component sumador4bits 
	port
	(
		-- Input ports
		A, B : in  std_logic_vector(3 downto 0);
		sum  : out std_logic_vector(3 downto 0);
      cout : out std_logic
	);
end component;

    component BCD7SEG 
	 port
(

		A,B,C,D	: in  std_logic;

		F	: out std_logic_vector(6 downto 0)
	);

end component;
begin


    sum1: sumador4bits port map(num1, num2, resultado, salida);
    convert1: BCD7SEG port map(resultado(0),resultado(1),resultado(2),resultado(3), display1);
    convert2: BCD7SEG port map(resultado(0),resultado(1),resultado(2),resultado(3), display2);
end architecture arch_Comparador;