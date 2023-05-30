library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity registers is 
Port(
    clk : in std_logic;
    rs_addr : in std_logic_vector(1 downto 0);
    rt_addr : in std_logic_vector(1 downto 0);
    rd_addr : in std_logic_vector(1 downto 0);
    wr_data : in std_logic_vector(7 downto 0);
    rs : out std_logic_vector(7 downto 0);
    rt : out std_logic_vector(7 downto 0)
);

end registers;

architecture Behavioral of Registers is
    type registerFile is array(0 to 3) of std_logic_vector(7 downto 0);
    signal reg: registerFile := (
        "11000010",
        "11010101",
        "11101011",
        "01000111"
    );
    begin
        process(clk)
        begin
            if falling_edge(clk) then
                reg(to_integer(unsigned(rd_addr))) <= wr_data;
            end if;
        end process;
    rs <= reg(to_integer(unsigned(rs_addr)));
    rt <= reg(to_integer(unsigned(rt_addr)));
    end Behavioral;