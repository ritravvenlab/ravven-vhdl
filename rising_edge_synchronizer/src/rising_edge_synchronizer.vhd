-------------------------------------------------------------------------------
-- Dr. Kaputa
-- rising edge synchronizer
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      

entity rising_edge_synchronizer is 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    input             : in std_logic;
    edge              : out std_logic
  );
end rising_edge_synchronizer;

architecture beh of rising_edge_synchronizer is
-- signal declarations
signal input_z     : std_logic;
signal input_zz    : std_logic;
signal input_zzz   : std_logic;

begin 
synchronizer: process(reset,clk,input)
  begin
    if reset = '1' then
      input_z     <= '1';
      input_zz    <= '1';
    elsif rising_edge(clk) then
      input_z   <= input;
      input_zz  <= input_z;
    end if;
end process;  

rising_edge_detector: process(reset,clk,input_zz)
  begin
    if reset = '1' then
      edge        <= '0';
      input_zzz   <= '1';
    elsif rising_edge(clk) then
      input_zzz   <= input_zz;
      edge <= (input_zz xor input_zzz) and input_zz;
    end if;
end process;  
end beh; 