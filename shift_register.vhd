LIBRARY IEEE; USE IEEE.STD_LOGIC_1164.ALL;
ENTITY shift_register IS
	GENERIC(N      :    integer := 31);
	PORT(clk, hold : IN STD_LOGIC;
		sin  : IN  STD_LOGIC;
		q    : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		sout : OUT STD_LOGIC
	);
END ENTITY;
ARCHITECTURE synth OF shift_register IS
	SIGNAL help : STD_LOGIC_VECTOR (N-1 DOWNTO 0);
BEGIN
	PROCESS(clk) BEGIN
		IF rising_edge(clk) AND hold = '0' THEN
			sout <= help(N-1);
			help <= help(N-2 DOWNTO 0) & sin;
		END IF;
	END PROCESS;
	q <= help WHEN hold = '1' ELSE (others => 'Z');
END ARCHITECTURE;