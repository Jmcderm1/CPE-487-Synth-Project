LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY dac_if IS
    PORT (
        SCLK : IN STD_LOGIC;              -- Serial clock
        LRCK : IN STD_LOGIC;              -- Left-Right clock (sample rate, e.g., 48 kHz)
        SDATA : OUT STD_LOGIC             -- Serial data output
    );
END dac_if;

ARCHITECTURE Behavioral OF dac_if IS
    SIGNAL SREG : SIGNED (15 DOWNTO 0) := to_signed(32767, 16); -- Fixed value for steady tone
BEGIN
    PROCESS (SCLK)
    BEGIN
        IF rising_edge(SCLK) THEN
            -- Output MSB of SREG to SDATA and shift left
            SDATA <= SREG(15);           -- Output the MSB
            SREG <= SREG(14 DOWNTO 0) & SREG(15); -- Shift left and wrap MSB for steady pattern
        END IF;
    END PROCESS;
END Behavioral;
