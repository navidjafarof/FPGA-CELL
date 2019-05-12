LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CLB IS 
PORT(
    input:             IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    clb_IN:            IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    second_mux_select: IN  STD_LOGIC;
    clk:               IN  STD_LOGIC;
    clb_OUT:           OUT STD_LOGIC
);
END ENTITY;

ARCHITECTURE test OF CLB IS

COMPONENT flipflop 
    PORT(clk: IN  STD_LOGIC;
         d:   IN  STD_LOGIC;
         q:   OUT STD_LOGIC
    );
END COMPONENT;

COMPONENT mux4 
    PORT(d: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
         s: IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
         y: OUT STD_LOGIC
    );
END COMPONENT;

SIGNAL mux_result: STD_LOGIC;
SIGNAL ff_result:  STD_LOGIC;

BEGIN
    
    big_mux: mux4     PORT MAP(input,clb_IN,mux_result);

    ff:      flipflop PORT MAP(clk, mux_result, ff_result);

    clb_OUT <= ff_result WHEN second_mux_select = '0' ELSE
               mux_result;

END ARCHITECTURE;