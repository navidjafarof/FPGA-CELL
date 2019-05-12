LIBRARY IEEE; USE IEEE.STD_LOGIC_1164.ALL;

ENTITY flipflop IS
    PORT(clk: IN  STD_LOGIC;
         d:   IN  STD_LOGIC;
         q:   OUT STD_LOGIC
);
END ENTITY;

ARCHITECTURE synth OF flipflop IS
BEGIN
    PROCESS(clk) BEGIN
        IF rising_edge(clk) THEN
            q <= d;
        END IF;
    END PROCESS;
END;