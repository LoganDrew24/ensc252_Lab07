-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity TestBlinkSystem is
  port (
    CLOCK_50 : in std_logic;
    SW : in std_logic_vector(0 downto 0);
    HEX5, HEX4, HEX3 : out std_logic_vector (6 downto 0);
    LEDR : out std_logic_vector (9 downto 0)
    );
  end TestBlinkSystem;

  architecture behaviour of TestBlinkSystem is

component BlinkSystem is
    port (
    clock, enable : in std_logic;
    seg0, seg1, seg2 : out std_logic_vector (6 downto 0);
    LED : out std_logic_vector (9 downto 0)
  );
  end component;

  begin
inst1:BlinkSystem
  port map(enable => SW(0), clock => CLOCK_50, seg0 => HEX5, seg1 => HEX4, seg2 => HEX3, LED => LEDR);

    end behaviour;
