# Windows XP Sounds
A MATLAB tool for reproducing the sounds of the Microsoft Windows XP operating system.

# Installation
Add the `winxpsound` directory to your MATLAB path. Run the following command in MATLAB, replacing `<winxpsound_path>` with the path to the `winxpsound` directory on your system. 
```matlab
addpath('<winxpsound_path>');
```

# Examples
```matlab
winxpsound; % Play a random sound

winxpsound('startup'); % Play the startup sound

[y,fs] = winxpsound('shutdown'); % Save the audio data and sample rate for the shutdown sound
```
