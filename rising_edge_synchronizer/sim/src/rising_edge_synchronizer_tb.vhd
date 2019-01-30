-------------------------------------------------------------------------------
-- Dr. Kaputa
-- edge detector test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      -- gives you the std_logic type

entity rising_edge_synchronizer_tb is 
end rising_edge_synchronizer_tb;

architecture beh of rising_edge_synchronizer_tb is

component rising_edge_synchronizer is 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    input             : in std_logic;
    edge              : out std_logic
  );
end component;
  
constant period         : time := 20ns;                                              
signal clk              : std_logic := '0';
signal reset            : std_logic := '1';
signal input            : std_logic := '1';
signal edge             : std_logic;

begin 
uut: rising_edge_synchronizer 
  port map(
    clk               => clk,
    reset             => reset,
    input             => input,
    edge              => edge
  );
 
-- clock process
clock: process
  begin
    clk <= not clk;
    wait for period/2;
end process; 
 
-- reset process
async_reset: process
  begin
    wait for 2 * period;
    reset <= '0';
    wait;
end process; 
    
main: process 
  begin
    assert false report "****************** TB Start ****************" severity note;
    wait for 90 ns;
    input <= '0';
    wait for 100 ns;
    input <= '1';
    assert false report "****************** TB Finish ****************" severity note;
    wait;
  end process;  
end beh;