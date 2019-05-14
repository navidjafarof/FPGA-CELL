LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SB IS
	PORT(
		in_2_up : IN STD_LOGIC;
		in_4_up : IN STD_LOGIC;

		in_2_down : IN STD_LOGIC;
		in_4_down : IN STD_LOGIC;

		in_1_right : IN STD_LOGIC;
		in_3_right : IN STD_LOGIC;

		in_1_left : IN STD_LOGIC;
		in_3_left : IN STD_LOGIC;

		out_1_up : OUT STD_LOGIC;
		out_3_up : OUT STD_LOGIC;

		out_1_down : OUT STD_LOGIC;
		out_3_down : OUT STD_LOGIC;

		out_2_right : OUT STD_LOGIC;
		out_4_right : OUT STD_LOGIC;

		out_2_left : OUT STD_LOGIC;
		out_4_left : OUT STD_LOGIC;

		select_mux_up_1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		select_mux_up_3 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		select_mux_down_1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		select_mux_down_3 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		select_mux_left_2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		select_mux_left_4 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		select_mux_right_2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		select_mux_right_4 : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END ENTITY;
ARCHITECTURE test OF SB IS
	COMPONENT mux3 IS
		PORT(d1 : IN STD_LOGIC;
			d2 : IN  STD_LOGIC;
			d3 : IN  STD_LOGIC;
			s  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
			y  : OUT STD_LOGIC
		);
	END COMPONENT;
BEGIN
		mux_1_up : mux3 PORT MAP (in_1_right, in_1_left, in_4_down, select_mux_up_1, out_1_up);
		mux_3_up : mux3 PORT MAP (in_3_left, in_2_down, in_3_right, select_mux_up_3, out_3_up);

		mux_1_down : mux3 PORT MAP (in_3_right, in_1_left, in_4_up, select_mux_down_1, out_1_down);
		mux_3_down : mux3 PORT MAP (in_3_left, in_2_up, in_1_right, select_mux_down_3, out_3_down);

		mux_2_left : mux3 PORT MAP (in_4_up, in_3_right, in_4_down, select_mux_left_2, out_2_left);
		mux_4_left : mux3 PORT MAP (in_2_up, in_1_right, in_2_down, select_mux_left_4, out_4_left);

		mux_2_right : mux3 PORT MAP (in_4_up, in_3_left, in_2_down, select_mux_right_2, out_2_right);
		mux_4_right : mux3 PORT MAP (in_2_up, in_1_left, in_4_down, select_mux_right_4, out_4_right);
END ARCHITECTURE;