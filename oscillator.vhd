library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY oscillator IS
    PORT (
        clk : IN STD_LOGIC; -- Clock input
        pitch : IN UNSIGNED (13 DOWNTO 0); -- Pitch value
        waveform : OUT STD_LOGIC -- Generated waveform output
    );
END oscillator;

ARCHITECTURE Behavioral OF oscillator IS
    SIGNAL counter : UNSIGNED (13 DOWNTO 0) := (OTHERS => '0');
    SIGNAL toggle : STD_LOGIC := '0';
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- Toggle waveform at half the pitch value for correct frequency
            IF counter = pitch / 2 THEN
                counter <= (OTHERS => '0');
                toggle <= NOT toggle;
            ELSE
                counter <= counter + 1;
            END IF;
        END IF;
    END PROCESS;
    
    waveform <= toggle;
END Behavioral;
