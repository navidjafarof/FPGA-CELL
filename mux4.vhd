LIBRARY IEEE; USE IEEE.STD_LOGIC_1164.ALL;
ENTITY mux4 IS
PORT(d: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
     s: IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
     y: OUT STD_LOGIC
);
END ENTITY;
ARCHITECTURE synth OF mux4 IS
BEGIN
    y <= d(0) WHEN  s = "00" ELSE
         d(1) WHEN  s = "01" ELSE
         d(2) WHEN  s = "10" ELSE
         d(3);
end;