LIBRARY IEEE; USE IEEE.STD_LOGIC_1164.ALL;
ENTITY mux3 IS
     PORT(d1: IN  STD_LOGIC;
          d2: IN  STD_LOGIC;
          d3: IN  STD_LOGIC;
          s:  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
          y:  OUT STD_LOGIC
     );
END ENTITY;
ARCHITECTURE synth OF mux3 IS
BEGIN
    y <= d1 WHEN  s = "00" ELSE
         d2 WHEN  s = "01" ELSE
         d3 WHEN  s = "10" ELSE
			d3;
END ARCHITECTURE;