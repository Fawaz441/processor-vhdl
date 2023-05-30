library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
    Port(
        op: in std_logic_vector (1 downto 0);
        rs: in std_logic_vector (7 downto 0);
        rt: in std_logic_vector (7 downto 0);
        rd: out std_logic_vector (7 downto 0)
    );
end alu;


architecture Behavioral of alu is

    signal result : std_logic_vector(7 downto 0);
    begin
        process(op,rs,rt)
        begin
            if(op == "00") then
                result <= rs and rt;
            elsif (op == "01") then
                result <= rs + rt;
            elsif (op == "10") then
                result <= rs - rt;
            elsif (op == "11") then
                result <= rs + rt;
            end if;
        end process;

begin

end arch ; -- arch