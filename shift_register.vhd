LIBRARY IEEE; USE IEEE.STD_LOGIC_1164.ALL;
ENTITY shift_register IS
	GENERIC(N: integer := 31);
	PORT(clk, reset: IN STD_LOGIC;
		 sin: IN STD_LOGIC;
		 q: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		 sout: OUT STD_LOGIC
	);
END ENTITY;
ARCHITECTURE synth OF shift_register IS
SIGNAL help : STD_LOGIC_VECTOR (N-1 DOWNTO 0);
BEGIN
	PROCESS(clk, reset) BEGIN
		IF reset = '1' THEN help <= (OTHERS => '0');
		ELSIF rising_edge(clk) THEN
			help <= help(N-2 DOWNTO 0) & sin;
		END IF;
	END PROCESS;
	sout <= help(N-1);
	q <= help;
END ARCHITECTURE;