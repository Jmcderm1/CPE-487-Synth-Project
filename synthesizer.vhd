LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY synthesizer IS
    PORT (
        clk_50MHz : IN STD_LOGIC; -- System clock (50 MHz)
        note_select : IN UNSIGNED (15 DOWNTO 0); -- Match width for all switches (S0-S15)
        gate : IN STD_LOGIC; -- Gate signal to control note
        audio_out : OUT STD_LOGIC;  -- Mono audio output (PWM)
        led1 : OUT STD_LOGIC;  -- LED1 for visual feedback (optional)
        led2 : OUT STD_LOGIC;  -- LED2 for visual feedback (optional)
        led3 : OUT STD_LOGIC   -- LED3 for visual feedback (optional)
    );
END synthesizer;

ARCHITECTURE Behavioral OF synthesizer IS
    SIGNAL pitch_value : UNSIGNED (13 DOWNTO 0);
    SIGNAL waveform : STD_LOGIC;
    SIGNAL amplitude : UNSIGNED (7 DOWNTO 0);
    SIGNAL pwm_signal : STD_LOGIC;  -- Single-bit PWM output

    COMPONENT pitch IS
        PORT (
            clk : IN STD_LOGIC;
            note_select : IN UNSIGNED (15 DOWNTO 0);
            pitch_out : OUT UNSIGNED (13 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT oscillator IS
        PORT (
            clk : IN STD_LOGIC;
            pitch : IN UNSIGNED (13 DOWNTO 0);
            waveform : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT envelope IS
        PORT (
            clk : IN STD_LOGIC;
            gate : IN STD_LOGIC;
            amplitude : OUT UNSIGNED (7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT output IS
        PORT (
            waveform : IN STD_LOGIC;
            amplitude : IN UNSIGNED (7 DOWNTO 0);
            audio_out : OUT STD_LOGIC -- Single-bit PWM audio output
        );
    END COMPONENT;

BEGIN
    -- Instantiate pitch module
    pitch_inst : pitch
        PORT MAP (
            clk => clk_50MHz,
            note_select => note_select,
            pitch_out => pitch_value
        );

    -- Instantiate oscillator
    osc_inst : oscillator
        PORT MAP (
            clk => clk_50MHz,
            pitch => pitch_value,
            waveform => waveform
        );

    -- Instantiate envelope generator
    env_inst : envelope
        PORT MAP (
            clk => clk_50MHz,
            gate => gate,
            amplitude => amplitude
        );

    -- Instantiate output module
    output_inst : output
        PORT MAP (
            waveform => waveform,
            amplitude => amplitude,
            audio_out => pwm_signal
        );

    -- Assign PWM signal to the audio output
    audio_out <= pwm_signal;

    -- Assign internal signals to LEDs for visual debugging
    led1 <= waveform;  -- Observe waveform signal
    led2 <= pwm_signal;  -- Observe PWM output
    led3 <= gate;  -- Observe gate signal

END Behavioral;
