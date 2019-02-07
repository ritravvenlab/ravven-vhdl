-------------------------------------------------------------------------------
-- Dr. Kaputa
-- tunable blink_tunable led demo
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;    

entity blink_tunable is
  port (
    clk             : in  std_logic; 
    reset           : in  std_logic;
    max_count       : in  std_logic_vector(26 downto 0);
    output          : out std_logic
  );  
end blink_tunable;  

architecture beh of blink_tunable  is

signal count_sig    : std_logic_vector(26 downto 0);
signal output_sig   : std_logic;

begin
process(clk,reset)
  begin
    if (reset = '1') then 
      count_sig <= (others => '0');
      output_sig <= '0';
    elsif (clk'event and clk = '1') then
      if (count_sig = max_count) then
        count_sig <= (others => '0');
        output_sig <= not output_sig;
      else
        count_sig <= std_logic_vector(unsigned(count_sig) + 1 );
      end if; 
    end if;
  end process;
  
  output <= output_sig;
end beh;