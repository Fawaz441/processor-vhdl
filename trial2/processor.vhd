library ieee;
use ieee.std_logic_1164.all;

entity processor is
    Port(clk: in std_logic;
        value: out std_logic_vector (7 downto 0)
    );

end processor;

architecture Behavioral of processor is
    component alu
        PORT(
            op: in std_logic_vector(1 downto 0);
            rs: in std_logic_vector(7 downto 0);
            rt: in std_logic_vector(7 downto 0);
            rd: out std_logic_vector(7 downto 0)
            );
    end component;

    component control
        PORT(
            instr: in std_logic_vector(1 downto 0);
            alu_src: out std_logic;
            reg_dst: out std_logic;
            alu_op: out std_logic_vector(1 downto 0)
        );
    end component;

    component instruction
        PORT(
            instr_addr:in std_logic_vector(2 downto 0);
            op: out std_logic_vector(1 downto 0);
            rd_addr: out std_logic_vector(1 downto 0);
            rs_addr: out std_logic_vector(1 downto 0);
            rt_addr: out std_logic_vector(1 downto 0)
        );
    end component;

    component mux0
        PORT(
            sel:in std_logic;
            a : in std_logic_vector(1 downto 0);
            b :in std_logic_vector(1 downto 0);
            y: out std_logic_vector(1 downto 0)
        );
    end component;

    
    component mux1
        PORT(
            sel : in std_logic;
            a : in std_logic_vector(7 downto 0);
            b :in std_logic_vector(7 downto 0);
            y: out std_logic_vector(7 downto 0)
        );
    end component;

    component pc
        Port(
            clk: in std_logic;
            next_instr: out std_logic_vector(2 downto 0)
        );
    end component;

    component registers
        Port(
            clk : in std_logic;
            rs_addr : in std_logic_vector(1 downto 0);
            rt_addr : in std_logic_vector(1 downto 0);
            rd_addr : in std_logic_vector(1 downto 0);
            wr_data : in std_logic_vector(7 downto 0);
            rs : out std_logic_vector(7 downto 0);
            rt : out std_logic_vector(7 downto 0)
        );
    end component;

    component sign_extend
        Port(
            data_in : in std_logic_vector(1 downto 0);
            data_out : out std_logic_vector(7 downto 0)
        );
    end component;

    signal WIRE_0 : std_logic_vector(1 downto 0);
    signal WIRE_1 : std_logic_vector(7 downto 0);
    signal WIRE_2 : std_logic_vector(7 downto 0);
    signal WIRE_3 : std_logic_vector(1 downto 0);
    signal WIRE_5 : std_logic;
    signal WIRE_18 : std_logic_vector(1 downto 0);
    signal WIRE_19 : std_logic_vector(1 downto 0);
    signal WIRE_8 : std_logic;
    signal WIRE_9 : std_logic_vector(7 downto 0);
    signal WIRE_10 : std_logic_vector(7 downto 0);
    signal WIRE_12 : std_logic_vector(1 downto 0);
    signal WIRE_13 : std_logic_vector(1 downto 0);
    signal WIRE_14 : std_logic_vector(2 downto 0);
    signal WIRE_15 : std_logic_vector(7 downto 0);


    begin

        value <= WIRE_15;
        arithmetic_logic_unit : alu
        PORT_MAP(
            op => WIRE_0,
            rs => WIRE_1,
            rt => WIRE_2,
            rd => WIRE_15
            );

        control_unit:control 
        PORT_MAP(
            instr => WIRE_3,
            alu_src => WIRE_8,
            reg_dst => WIRE_5,
            alu_op => WIRE_0
        );

        instruction_memory : instruction
        PORT_MAP(
            instr_addr => WIRE_14,
            op => WIRE_3,
            rd_addr => WIRE_19,
            rs_addr => WIRE_13,
            rt_addr => WIRE_18
        );

        mux_0: mux0
        PORT_MAP(
            sel => WIRE_5,
            a => WIRE_18,
            b => WIRE_19,
            y => WIRE_12
        );

        mux_1: mux1
        PORT_MAP(
            sel => WIRE_8,
            a => WIRE_9,
            b => WIRE_10,
            y => WIRE_2
        );

        program_counter: pc
        PORT_MAP(
            clk => clk,
            next_instr => WIRE_14
        );

        registers_file : registers
        PORT_MAP(
            clk => clk,
            rd_addr => WIRE_12,
            rs_addr => WIRE_13,
            rt_addr => WIRE_18,
            wr_data => WIRE_15,
            rs => WIRE_1,
            rt => WIRE_9
        );

        sign_extend: sign_extend
        PORT_MAP(
            data_in => WIRE_19,
            data_out => WIRE_10
        );

end Behavioral;