library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity fpga_cell_tb is
end entity fpga_cell_tb;

architecture testbench of fpga_cell_tb is
	signal prog_clk    : STD_LOGIC;
	signal prog_in     : STD_LOGIC;
	signal hold        : STD_LOGIC;
	signal in_2_up     : STD_LOGIC;
	signal in_4_up     : STD_LOGIC;
	signal in_2_down   : STD_LOGIC;
	signal in_4_down   : STD_LOGIC;
	signal in_1_right  : STD_LOGIC;
	signal in_3_right  : STD_LOGIC;
	signal in_1_left   : STD_LOGIC;
	signal in_3_left   : STD_LOGIC;
	signal out_1_up    : STD_LOGIC;
	signal out_3_up    : STD_LOGIC;
	signal out_1_down  : STD_LOGIC;
	signal out_3_down  : STD_LOGIC;
	signal out_2_right : STD_LOGIC;
	signal out_4_right : STD_LOGIC;
	signal out_2_left  : STD_LOGIC;
	signal out_4_left  : STD_LOGIC;
	signal prog_out    : STD_LOGIC;

	signal data : STD_LOGIC_VECTOR(30 DOWNTO 0);

	constant C_CLK_PERIOD : real := 10.0e-9; -- NS

begin
	-----------------------------------------------------------
	-- Clocks and Reset
	-----------------------------------------------------------
	CLK_GEN : process
	begin
		prog_clk <= '1';
		wait for C_CLK_PERIOD / 2.0 * (1 SEC);
		prog_clk <= '0';
		wait for C_CLK_PERIOD / 2.0 * (1 SEC);
	end process CLK_GEN;


	-----------------------------------------------------------
	-- Testbench Stimulus
	-----------------------------------------------------------
	in_1_left  <= prog_clk;
	process
	begin			  
					--"clkMux(2)_clbMuxIn1(2)_clbMuxIn0(2)_cbOutRDU(2)_cbOutLDU(2)_up_down_right_left_clbResultMux_clbMuxInput(4)"
		data       <= "0001101011000100000000000001010";
		hold       <= '0';
		in_2_up    <= 'Z';
		in_4_up    <= '0';
		in_2_down  <= 'Z';
		in_4_down  <= 'Z';
		in_1_right <= 'Z';
		in_3_right <= 'Z';
		in_3_left  <= '0';

		for i in 30 downto 0 loop
			wait for C_CLK_PERIOD * (1 SEC);
			prog_in <= data(i);
		end loop ;
		wait for C_CLK_PERIOD * (1 SEC);
		hold <= '1';

		wait for 2.0*C_CLK_PERIOD * (1 SEC);
		in_4_up <= '0';
		in_3_left  <= '1';

		wait for 2.0*C_CLK_PERIOD * (1 SEC);
		in_4_up <= '1';
		in_3_left  <= '0';
		
		wait for 2.0*C_CLK_PERIOD * (1 SEC);
		in_4_up <= '1';
		in_3_left  <= '1';
		wait;
	end process;

	-----------------------------------------------------------
	-- Entity Under Test
	-----------------------------------------------------------
	DUT : entity work.fpga_cell
		port map (
			prog_clk    => prog_clk,
			prog_in     => prog_in,
			hold        => hold,
			in_2_up     => in_2_up,
			in_4_up     => in_4_up,
			in_2_down   => in_2_down,
			in_4_down   => in_4_down,
			in_1_right  => in_1_right,
			in_3_right  => in_3_right,
			in_1_left   => in_1_left,
			in_3_left   => in_3_left,
			out_1_up    => out_1_up,
			out_3_up    => out_3_up,
			out_1_down  => out_1_down,
			out_3_down  => out_3_down,
			out_2_right => out_2_right,
			out_4_right => out_4_right,
			out_2_left  => out_2_left,
			out_4_left  => out_4_left,
			prog_out    => prog_out
		);

end architecture testbench;