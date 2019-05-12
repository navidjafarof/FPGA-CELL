LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CB IS 
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
END ENTITY;

ARCHITECTURE test OF CB IS

COMPONENT mux4 
    PORT(d0:IN STD_LOGIC;
         d1: IN STD_LOGIC;
         d2: IN STD_LOGIC;
	      d3: IN STD_LOGIC;
         s: IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
         y: OUT STD_LOGIC
	);
END COMPONENT; 

BEGIN

    mux_clb_in_0: mux4 PORT MAP(in_left_up, in_right_up, in_left_down, in_right_down, select_mux_clb_in_0, clb_in(0));
    mux_clb_in_1: mux4 PORT MAP(in_left_up, in_right_up, in_left_down, in_right_down, select_mux_clb_in_1, clb_in(1));
    mux_clb_clk:  mux4 PORT MAP(in_left_up, in_right_up, in_left_down, in_right_down, select_mux_clb_clk, clb_clk);

    out_left_up    <= clb_out WHEN select_mux_left_up   = '0' ELSE
                      in_right_up;
    out_left_down  <= clb_out WHEN select_mux_left_down = '0' ELSE
                      in_right_down;
    out_right_up   <= clb_out WHEN select_mux_right_up  = '0' ELSE
                      in_left_up;
    out_right_down <= clb_out WHEN select_mux_right_down  = '0' ELSE
                      in_left_down;
END ARCHITECTURE;