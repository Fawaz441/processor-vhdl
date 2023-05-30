library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity instruction is
    Port(
        inst_addr: in std_logic_vector(2 downto 0);
        op: out std_logic_vector(1 downto 0);
        rs_addr: out std_logic_vector(1 downto 0);
        rt_addr: out std_logic_vector(1 downto 0);
        rd_addr: out std_logic_vector(1 downto 0)
    );

end instruction;

architecture Behavioral of instruction is
    type instruction_set is array (0 to 7) of std_logic_vector(7 downto 0);
    constant intsr : instruction_set := (
        "01000010",
        "11010101",
        "11101011",
        "01000111",
        "10101100",
        "00000000",
        "00000000",
        "00000000"
    );
    begin
    op<= instr(to_integer(unsigned(instr_addr)))(7 downto 6);
    rs_addr<= instr(to_integer(unsigned(instr_addr)))(5 downto 4);
    rt_addr<= instr(to_integer(unsigned(instr_addr)))(3 downto 2);
    rd_addr<= instr(to_integer(unsigned(instr_addr)))(1 downto 0);
    end Behavioral;