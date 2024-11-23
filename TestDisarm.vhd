-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity TestDisarm is
port (
		KEY : in std_logic_vector(0 downto 0);
		SW : in std_logic_vector(1 downto 0);
		HEX0, HEX1, HEX2 : out std_logic_vector(6 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
		);
end TestDisarm;

architecture behaviour of TestDisarm is

signal clock_sig : std_logic;

component DisarmSystem is
port (
		clock : in std_logic;
		w : in std_logic_vector(1 downto 0);
		disarm : out std_logic;
		seg2, seg1, seg0 : out std_logic_vector(6 downto 0)
		);
end component;

begin

inst1 : DisarmSystem
port map (seg0 => HEX2, seg1 => HEX1, seg2 => HEX0, disarm => LEDR(0), clock => KEY(0), w => SW);

end behaviour;