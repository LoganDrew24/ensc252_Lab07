-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity DisarmSystem is
port (
		clock : in std_logic;
		w : in std_logic_vector(1 downto 0);
		disarm : out std_logic;
		seg2, seg1, seg0 : out std_logic_vector(6 downto 0)
		);
end DisarmSystem;

architecture behaviour of DisarmSystem is

type state_type is (a, b, c, d);--basically state diagram generation

signal NS, CS : state_type; --signal for next and current states

begin
	process(CS, w)
		begin
			case CS is
				when a=>
						seg0<="1111111";
						seg1<="1111111";
						seg2<="1111111";
				
				if (w = "11") then --11 = first digit (3) in the code
					NS<=b;
					
					else
					
					NS <= a;
					end if;
					
				when b=>
					seg0<="0110000";--3
					seg1<="1111111";
					seg2<="1111111";
					
				if (w = "10") then
					NS <= c;
					
					else
					
					NS <= a;
					
				end if;
				
				when c=>
					seg0<="0110000";--3
					seg1<="1111001";--1
					seg2<="1111111";
				
				if (w = "10") then
				
					NS <= d;
					
					else
					
					NS <= a;
					
				end if;
				
				when d=>
					seg0<="0110000";--3
					seg1<="1111001";--1
					seg2<="1111111";--2
				NS <= a;
				
				end case;

end process;

process(clock)
begin
	if rising_edge(clock) then
		CS <= NS;
		end if;
		
end process;

disarm <= '1' when CS = d
else '0';

end behaviour;