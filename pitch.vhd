library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY pitch IS
    PORT (
        clk : IN STD_LOGIC;
        note_select : IN UNSIGNED (15 DOWNTO 0); -- 16-bit input for all switches
        pitch_out : OUT UNSIGNED (13 DOWNTO 0) -- Output pitch value
    );
END pitch;

ARCHITECTURE Behavioral OF pitch IS
    TYPE pitch_array IS ARRAY (0 TO 15) OF UNSIGNED (13 DOWNTO 0); -- Array for 16 switches
    CONSTANT pitch_values : pitch_array := (
        -- C Major scale from C3 to D5 (example frequencies)
        to_unsigned(61156, 14), -- SW0: C3 = 130.81 Hz
        to_unsigned(54482, 14), -- SW1: D3 = 146.83 Hz
        to_unsigned(48544, 14), -- SW2: E3 = 164.81 Hz
        to_unsigned(45816, 14), -- SW3: F3 = 174.61 Hz
        to_unsigned(40816, 14), -- SW4: G3 = 196.00 Hz
        to_unsigned(36364, 14), -- SW5: A3 = 220.00 Hz
        to_unsigned(32396, 14), -- SW6: B3 = 246.94 Hz
        to_unsigned(30578, 14), -- SW7: C4 = 261.63 Hz
        to_unsigned(27241, 14), -- SW8: D4 = 293.66 Hz
        to_unsigned(24272, 14), -- SW9: E4 = 329.63 Hz
        to_unsigned(22908, 14), -- SW10: F4 = 349.23 Hz
        to_unsigned(20408, 14), -- SW11: G4 = 392.00 Hz
        to_unsigned(18182, 14), -- SW12: A4 = 440.00 Hz
        to_unsigned(16198, 14), -- SW13: B4 = 493.88 Hz
        to_unsigned(15289, 14), -- SW14: C5 = 523.25 Hz
        to_unsigned(13620, 14)  -- SW15: D5 = 587.33 Hz
    );
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- Use priority encoder: take the first switch that is on
            IF note_select(0) = '1' THEN
                pitch_out <= pitch_values(0);
            ELSIF note_select(1) = '1' THEN
                pitch_out <= pitch_values(1);
            ELSIF note_select(2) = '1' THEN
                pitch_out <= pitch_values(2);
            -- Continue for all switches
            ELSIF note_select(15) = '1' THEN
                pitch_out <= pitch_values(15);
            ELSE
                pitch_out <= (OTHERS => '0'); -- Default when no switch is active
            END IF;
        END IF;
    END PROCESS;
END Behavioral;
