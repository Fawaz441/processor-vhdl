library ieee;
use ieee_std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pc is
    Port(clk: in std_logic;
        next_instr: out std_logic_vector(2 downto 0)
    );
end pc;

architecture Behavioral of pc is 
    signal current_signal :std_logic_vector(2 downto 0):= "000";
begin
    process(clk)
    begin
        if falling_edge(clk) then
            current_signal <= std_logic_vector(unsigned(current_signal) + to_unsigned(1,3));
        end if;
    end process;
    next_instr <= current_signal;

end Behavioral;