LIBRARY IEEE; USE IEEE.STD_LOGIC_1164.ALL;
ENTITY fpga_cell IS
    PORT(
    );
END ENTITY;
ARCHITECTURE test OF fpga_cell IS

COMPONENT CLB 
    PORT(
        input:             IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        clb_IN:            IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        second_mux_select: IN  STD_LOGIC;
        clk:               IN  STD_LOGIC;
        clb_OUT:           OUT STD_LOGIC
    );
END COMPONENT;

COMPONENT SB 
    PORT(
        in_2_up     : IN STD_LOGIC;
        in_4_up     : IN STD_LOGIC;

        in_2_down   : IN STD_LOGIC;
        in_4_down   : IN STD_LOGIC;

        in_1_right  : IN STD_LOGIC;
        in_3_right  : IN STD_LOGIC;

        in_1_left   : IN STD_LOGIC;
        in_3_left   : IN STD_LOGIC;

        out_1_up    : OUT STD_LOGIC;
        out_3_up    : OUT STD_LOGIC;

        out_1_down  : OUT STD_LOGIC;
        out_3_down  : OUT STD_LOGIC;

        out_2_right : OUT STD_LOGIC;
        out_4_right : OUT STD_LOGIC;
    
        out_2_left  : OUT STD_LOGIC;
        out_4_left  : OUT STD_LOGIC;

        select_mux_up_1   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        select_mux_up_3   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

        select_mux_down_1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        select_mux_down_3 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

        select_mux_left_2   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        select_mux_left_4   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

        select_mux_right_2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        select_mux_right_4 : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END COMPONENT;


COMPONENT CB IS 
    PORT(in_left_up    : IN STD_LOGIC;
         in_left_down  : IN STD_LOGIC;
         in_right_up   : IN STD_LOGIC;
         in_right_down : IN STD_LOGIC;

         select_mux_left_up:    IN STD_LOGIC;
         select_mux_left_down:  IN STD_LOGIC;
         select_mux_right_up:   IN STD_LOGIC;
         select_mux_right_down: IN STD_LOGIC;

         select_mux_clb_in_0 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         select_mux_clb_in_1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         select_mux_clb_clk  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

         clb_out        : IN STD_LOGIC;

         out_left_up    : OUT STD_LOGIC;
         out_left_down  : OUT STD_LOGIC;
         out_right_up   : OUT STD_LOGIC;
         out_right_down : OUT STD_LOGIC;

         clb_in         : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         clb_clk        : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT shift_register IS
	GENERIC(N: integer := 31);
	PORT(clk, reset: IN STD_LOGIC;
		 sin: IN STD_LOGIC;
		 q: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		 sout: OUT STD_LOGIC
	);
END COMPONENT;

BEGIN
    
END ARCHITECTURE;