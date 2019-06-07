%seqcontrol() - This function is used to change the display properties of a sequence

%INPUTS: 
%ControlType: control parameter that is to be modified
%ControlValue: value of the parameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function seqcontrol(dll_name,hdevice,SequenceId,ControlType,ControlValue)
ControlType = int32(ControlType);
ControlValue = int32(ControlValue);
[return_seqcontrol] = calllib(dll_name,'AlpSeqControl', hdevice, SequenceId, ControlType, ControlValue);
errval = errorcheck(return_seqcontrol);
if errval == 1
    seqfree(dll_name,hdevice,SequenceId);
    devfree(hdevice);
    unloadlibrary alpV42
end
end