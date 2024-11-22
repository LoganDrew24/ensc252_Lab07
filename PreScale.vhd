-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity PreScale is
  port ( in_clock : in std_logic;
        out_clock : out std_logic
        );
  end PreScale;

  architecture behaviour of PreScale is
    signal acc : unsigned (24 downto 0):=(others=>'0');
begin
  process(in_clock)
  begin
    if rising_edge(in_clock) then
      acc <= acc + 1;
    end if
      end process;
      out_clock <= acc(24);
      end behaviour;
      
