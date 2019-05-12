LIBRARY IEEE; USE IEEE.STD_LOGIC_1164.ALL;
ENTITY fpga_cell IS
    PORT(prog_clk: IN STD_LOGIC;
         prog_in:  IN STD_LOGIC;
			reset:    IN STD_LOGIC;
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
			prog_out:  OUT STD_LOGIC
    );
END ENTITY;
ARCHITECTURE test OF fpga_cell IS

COMPONENT CLB 
    PORT(
        input:             IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        clb_in:            IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
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
	PORT(clk:   IN STD_LOGIC;
		  reset: IN STD_LOGIC;
		  sin:   IN STD_LOGIC;
		  q:     OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		  sout:  OUT STD_LOGIC
	);
END COMPONENT;
SIGNAL q:    	         STD_LOGIC_VECTOR (30 DOWNTO 0);
SIGNAL sout: 		      STD_LOGIC;
SIGNAL clb_in_help:     STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL clb_clk_help:    STD_LOGIC;
SIGNAL clb_out_help:    STD_LOGIC;
SIGNAL in_1_left_help:  STD_LOGIC;
SIGNAL in_3_left_help:  STD_LOGIC;
SIGNAL out_2_left_help: STD_LOGIC;
SIGNAL out_4_left_help: STD_LOGIC;
 
BEGIN

    shiftreg: shift_register GENERIC MAP(31) PORT MAP(prog_clk,reset,prog_in,q,prog_out);
	 
	 clb_ins: CLB PORT MAP(q(3 DOWNTO 0), clb_in_help, q(4),clb_clk_help, clb_out_help);
	 
	 cb_ins:  CB  PORT MAP(in_1_left,
						   in_3_left,
						   out_2_left_help,
						   out_4_left_help,
								  
						   q(21),
						   q(22),
						   q(23),
						   q(24),
								  
						   q(26 DOWNTO 25),
						   q(28 DOWNTO 27),
					       q(30 DOWNTO 29),
								  
						   clb_out_help,
								  
					   	   out_2_left,
						   out_4_left,
						   in_1_left_help,
						   in_3_left_help,
								  
						   clb_in_help,
						   clb_clk_help		  
				   );
								  
	 sb_ins:  SB  PORT MAP(in_2_up,
						   in_4_up, 
                           in_2_down, 
                           in_4_down, 
                           in_1_right, 
                           in_3_right, 
                           in_1_left_help,  
                           in_3_left_help,  
                           out_1_up, 
                           out_3_up, 
                           out_1_down, 
                           out_3_down, 
                           out_2_right, 
                           out_4_right, 
                           out_2_left_help,
                           out_4_left_help,
                           q(6  DOWNTO 5),
                           q(8  DOWNTO 7),
                           q(10 DOWNTO 9),
                           q(12 DOWNTO 11),
                           q(14 DOWNTO 13),
                           q(16 DOWNTO 15),
                           q(18 DOWNTO 17),
                           q(20 DOWNTO 19)
					);
END ARCHITECTURE;