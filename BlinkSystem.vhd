-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity BlinkSystem is
  port (
    clock, enable : in std_logic;
    seg0, seg1, seg2 : out std_logic_vector (6 downto 0);
    LED : out std_logic_vector (9 downto 0)
  );
  end BlinkSystem;

  architecture behaviour of BlinkSystem is
    signal clock_sig : std_logic:='0';

component PreScale is
   port ( in_clock : in std_logic;
        out_clock : out std_logic
        );
  end component

    begin
      process(clock_sig, enable)
      begin
        if (enable ='1') then
          if (clock_sig = '1')
            seg2 <= "0010010";
          seg1 <= "1000000";
        seg0 <= "0010010";
      LED <=(others=>'1');
      else
        seg2, seg1, seg0 <= "1111111";
      LED <=(others=>'0');
  end if
    else
      seg2, seg1, seg0 <= "1111111";
      LED <=(others=>'0');
    end if;
      end process;

      inst1: PreScale
    port map (in_clock => clock, out_clock => clock_sig);

    end behaviour;
            
