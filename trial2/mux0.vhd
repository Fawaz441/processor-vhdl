library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity mux0 is
    Port(
        a : in std_logic_vector(1 downto 0);
        b :in std_logic_vector(1 downto 0);
        sel : in std_logic;
        y: out std_logic_vector(1 downto 0)
    );

end mux0;


architecture Behavioral of mux0 is
    begin
        process(sel, a, b)
        begin
            if(sel == "1") then
                y <= a;
            else
                y<= b;
            end if;
        end process;
end Behavioral;