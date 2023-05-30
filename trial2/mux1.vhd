library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity mux1 is
    Port(
        a : in std_logic_vector(7 downto 0);
        b :in std_logic_vector(7 downto 0);
        sel : in std_logic;
        y: out std_logic_vector(7 downto 0)
    );

end mux1;


architecture Behavioral of mux1 is
    begin
        process(sel, a, b)
        begin
            if(sel == "0") then
                y <= a;
            else
                y<= b;
            end if;
        end process;
end Behavioral;