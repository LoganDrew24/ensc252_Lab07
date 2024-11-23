-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity AlarmSystem is
port (
		KEY : in std_logic_vector(0 downto 0);
		SW : in std_logic_vector(9 downto 0);
		CLOCK_50 : in std_logic;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out std_logic_vector(6 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
		);
end AlarmSystem;

architecture behaviour of AlarmSystem is

signal disarm_sig : std_logic;
signal trigger : std_logic:='0';

component BlinkSystem is
port (
    clock, enable : in std_logic;
    seg0, seg1, seg2 : out std_logic_vector (6 downto 0);
    LED : out std_logic_vector (9 downto 0)
  );
end component;

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
port map(seg0 => HEX2, seg1 => HEX1, seg2 => HEX0, disarm => disarm_sig, clock => KEY(0), w => SW(2 downto 1));

inst2 : BlinkSystem
port map(enable => trigger, clock => CLOCK_50, seg0 => HEX5, seg1 => HEX4, seg2 => HEX3, LED => LEDR);

process(CLOCK_50, trigger, disarm_sig, SW)
begin
	if rising_edge(CLOCK_50) then
		if (disarm_sig = '1') then
			trigger <= '0';
			
			elsif
			(SW(0) = '1') and ((SW(3) = '1') or (SW(4) = '1') or (SW(5) = '1')) then
				trigger <= '1';
			else
				trigger <= trigger;
				end if;
			else
			trigger <= trigger;
		end if;
		end process;
		
end behaviour;