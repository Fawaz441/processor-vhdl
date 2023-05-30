library ieee;
use ieee.std_logic_1164.all;

entity control is 
Port(
    instr: in std_logic_vector (1 downto 0);
    alu_op : out std_logic_vector (1 downto 0);
    alu_src : out std_logic;
    reg_dst:out std_logic
);

end control;

architecture Behavioral of control is
    begin
        with instr select
            alu_op <= "00" when "00",
            "01" when "01",
            "10" when "10",
            "11" when others;

        with instr select
            alu_src <= "1" when "11",
            "0" when others;

        with instr select
            reg_dst <= "1" when "11",
            "0" when others;

end Behavioral;