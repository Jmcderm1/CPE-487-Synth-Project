LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY output IS
    PORT (
        clk : IN STD_LOGIC;                 -- Clock input for PWM generation
        waveform : IN STD_LOGIC;            -- Input waveform
        amplitude : IN UNSIGNED (7 DOWNTO 0); -- Amplitude from envelope
        audio_out : OUT STD_LOGIC           -- Single-bit audio output for PWM
    );
END output;

ARCHITECTURE Behavioral OF output IS
    SIGNAL counter : UNSIGNED (7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- Increment the counter
            counter <= counter + 1;

            -- Simple PWM: Compare counter value with amplitude
            IF waveform = '1' THEN
                IF counter < amplitude THEN
                    audio_out <= '1';
                ELSE
                    audio_out <= '0';
                END IF;
            ELSE
                audio_out <= '0';
            END IF;
        END IF;
    END PROCESS;
END Behavioral;
