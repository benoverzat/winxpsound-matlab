function varargout = winxpsound(varargin)
% WINXPSOUND  Produce Windows XP system sounds.
%   WINXPSOUND(SOUNDNAME) plays the Windows XP system sound specified by 
%   SOUNDNAME. Valid sound names are as follows:
%       'balloon'
%       'batterycritical'
%       'batterylow'
%       'criticalstop'
%       'default'
%       'ding'
%       'error'
%       'exclamation'
%       'hardwarefail'
%       'hardwareinsert'
%       'hardwareremove'
%       'informationbar'
%       'logoff'
%       'logon'
%       'menucommand'
%       'minimize'
%       'notify'
%       'popupblocked'
%       'printcomplete'
%       'recycle'
%       'restore'
%       'ringin'
%       'ringout'
%       'shutdown'
%       'start'
%       'startup'
%
%   WINXPSOUND with no input arguments plays a random Windows XP system sound.
%
%   Y = WINXPSOUND(...) returns the audio sample data Y from the sound. The 
%   sound is not played.
%
%   [Y,FS] = WINXPSOUND(...) returns the sample data Y and sample rate FS from
%   the sound.

% Ben Overzat
% 2022
% All rights to Windows system sounds belong to Microsoft.

soundNameList = { ...
    'balloon', ...
    'batterycritical', ...
    'batterylow', ...
    'criticalstop', ...
    'default', ...
    'ding', ...
    'error', ...
    'exclamation', ...
    'hardwarefail', ...
    'hardwareinsert', ...
    'hardwareremove', ...
    'informationbar', ...
    'logoff', ...
    'logon', ...
    'menucommand', ...
    'minimize', ...
    'notify', ...
    'popupblocked', ...
    'printcomplete', ...
    'recycle', ...
    'restore', ...
    'ringin', ...
    'ringout', ...
    'shutdown', ...
    'start', ...
    'startup' ...
};
if nargin > 1
    error('Too many input arguments.');
end    
if nargout > 2
    error('Too many output arguments.');
end
resourceFolder = fullfile(fileparts(mfilename('fullpath')),'res');
if nargin > 0
    soundName = varargin{1};
    soundName = lower(soundName(isletter(soundName)));
    if ~any(strcmp(soundName,soundNameList))
        error('Invalid sound name. Run ''help winxpsound'' for a list of valid names.');
    end
else
    soundName = soundNameList{randi(length(soundNameList))};
end
[audio, fs] = audioread(fullfile(resourceFolder,[soundName '.wav']));
if nargout > 1
    varargout{2} = fs;
end
if nargout > 0
    varargout{1} = audio;
else
    sound(audio,fs);
end

end