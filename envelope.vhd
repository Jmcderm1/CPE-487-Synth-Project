LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY envelope IS
    PORT (
        clk : IN STD_LOGIC; -- Clock input
        gate : IN STD_LOGIC; -- Gate signal to start/stop the note
        amplitude : OUT UNSIGNED (7 DOWNTO 0) -- Amplitude level (ADSR)
    );
END envelope;

ARCHITECTURE Behavioral OF envelope IS
    TYPE state_type IS (IDLE, ATTACK, DECAY, SUSTAIN, RELEASE);
    SIGNAL state : state_type := IDLE;
    SIGNAL amp : UNSIGNED (7 DOWNTO 0) := (OTHERS => '0');

    CONSTANT max_amplitude : UNSIGNED(7 DOWNTO 0) := to_unsigned(255, 8);
    CONSTANT sustain_level : UNSIGNED(7 DOWNTO 0) := to_unsigned(128, 8);
    CONSTANT attack_rate : UNSIGNED(7 DOWNTO 0) := to_unsigned(1, 8); -- Adjust attack rate
    CONSTANT decay_rate : UNSIGNED(7 DOWNTO 0) := to_unsigned(1, 8);  -- Adjust decay rate
    CONSTANT release_rate : UNSIGNED(7 DOWNTO 0) := to_unsigned(1, 8); -- Adjust release rate
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            CASE state IS
                WHEN IDLE =>
                    IF gate = '1' THEN
                        state <= ATTACK;
                    END IF;

                WHEN ATTACK =>
                    IF amp < max_amplitude THEN
                        amp <= amp + attack_rate;
                    ELSE
                        state <= DECAY;
                    END IF;

                WHEN DECAY =>
                    IF amp > sustain_level THEN
                        amp <= amp - decay_rate;
                    ELSE
                        state <= SUSTAIN;
                    END IF;

                WHEN SUSTAIN =>
                    IF gate = '0' THEN
                        state <= RELEASE;
                    END IF;

                WHEN RELEASE =>
                    IF amp > to_unsigned(0, 8) THEN
                        amp <= amp - release_rate;
                    ELSE
                        state <= IDLE;
                    END IF;
            END CASE;
        END IF;
    END PROCESS;

    amplitude <= amp;
END Behavioral;
