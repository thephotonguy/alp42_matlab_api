%seqcontrol() - This function is used to change the display properties of a sequence

%INPUTS: 
%ControlType: control parameter that is to be modified
%ControlValue: value of the parameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[return_seqcontrol] = seqcontrol(dll_name,hdevice,SequenceId,ControlType,ControlValue)
ControlType = int32(ControlType);
ControlValue = int32(ControlValue);
[return_seqcontrol] = calllib(dll_name,'AlpSeqControl', hdevice, SequenceId, ControlType, ControlValue);

if return_seqcontrol == 0
    fprintf('%d : seqcontrol - Successfull execution. \n',return_seqcontrol)
elseif return_seqcontrol == 1003
    fprintf('%d : seqcontrol - The specified ALP identifier is not valid. \n', return_seqcontrol)
elseif return_seqcontrol == 1004
    fprintf('%d : seqcontrol - The specified ALP is already allocated. \n', return_seqcontrol)
elseif return_seqcontrol == 1005
   fprintf('%d : seqcontrol - One of the parameters is invalid. \n.', return_seqcontrol)
elseif return_seqcontrol == 1002
    fprintf('%d : seqcontrol - The ALP is not in idle state. \n', return_seqcontrol)
else
    fprintf('seqcontrol error code: %d. \n', return_seqcontrol)
end
end