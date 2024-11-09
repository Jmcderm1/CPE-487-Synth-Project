# Synthesizer Project for Nexys A7-100T

## Overview
This project involves creating a melodic synthesizer using the Nexys A7-100T FPGA board. The synthesizer generates audio output based on the pitch selected by the user through the 16 switches on the board, and it features an envelope generator, oscillator, and output module. Debugging information is also provided through on-board LEDs.

## Features
- **Oscillator Module**: Generates a waveform for the selected pitch, using a simple square wave.
- **Pitch Selection**: 16 switches represent different notes in the C Major scale (C3 to D5).
- **Envelope Generator**: Implements a simple ADSR (Attack, Decay, Sustain, Release) envelope to control the amplitude of the sound.
- **PWM Audio Output**: Uses pulse-width modulation (PWM) to generate audio through the onboard mono output.
- **Debug LEDs**: LED indicators show the status of the serial clocks and data signal for visual debugging.

## Project Files
- **VHDL Modules**:
  - `synthesizer.vhd`: The top-level module integrating all submodules.
  - `oscillator.vhd`: Generates square wave signals based on pitch input.
  - `pitch.vhd`: Decodes pitch based on the active switches.
  - `envelope.vhd`: Implements an ADSR envelope to modulate the amplitude.
  - `output.vhd`: Outputs audio signal using PWM.
  - `dac_if.vhd`: Simulates interfacing to a DAC using generated clock signals.

- **Constraints File**:
  - `synthesizer.xdc`: Specifies the pin locations and I/O standards for the FPGA board, including audio output and debugging LEDs.


## Setup Instructions
1. **Vivado Setup**:
   - Open Vivado and create a new project.
   - Add all provided VHDL files to the project.
   - Add the constraints file (`synthesizer.xdc`) to define pin mappings.
   - Set the target board as the Nexys A7-100T.
2. **Synthesis & Implementation**:
   - Run synthesis and implementation in Vivado.
   - Verify that there are no errors during these steps.
3. **Programming the Board**:
   - Generate the bitstream and program the Nexys A7-100T.
   - Connect an audio output device to the onboard audio jack to hear the synthesized output.

## Usage
- **Select Notes**: Use the switches (SW0 to SW15) to select a note from the C Major scale.
- **Gate Signal**: Press BTN C to activate the gate and hear the sound.
- **Debugging**: Observe the LEDs for clock signals and data activity.

## Troubleshooting
- **No Sound**: Ensure that the audio output is connected and that the gate button (BTN C) is pressed.
- **LEDs Not Toggling**: Check for proper clock signal generation; the LEDs should indicate activity for SCLK, LRCK, and SDATA.

## Future Improvements
- Implementing more waveforms such as sine, triangle, or sawtooth.
- Adding a polyphony feature to play multiple notes simultaneously, also known as chords.
- Improving the envelope generator for more dynamic sound modulation.
- Output sound using a stereo device such as the PMOD I2S, rather than the Nexys A7-100T's on board mono output

