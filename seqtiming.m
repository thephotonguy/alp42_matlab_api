%seqtiming() - This function controls the timing properties of the sequence display

%INPUTS:
%IlluminateTime - duration of the display of one picture in the sequence.
%PictureTime - time between the start of two consecutive pictures (i.e. this parameter defines the image display rate
%SynchDelay - specifies the time between start of the frame synch output pulse and the start of the display. 
%SynchPulseWidth - specifies the duration of the frame synch output pulse.
%TriggerInDelay - specifies the time between the incoming trigger edge and the start of the display. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[return_seqtiming] = seqtiming(dll_name,hdevice,SequenceId,IlluminateTime,PictureTime,SynchDelay,SynchPulseWidth,TriggerInDelay)
IlluminateTime = int32(IlluminateTime);
PictureTime = int32(PictureTime);
SynchDelay = int32(SynchDelay);
SynchPulseWidth = int32(SynchPulseWidth);
TriggerInDelay = int32(TriggerInDelay);
[return_seqtiming] = calllib(dll_name,'AlpSeqTiming', hdevice, SequenceId, IlluminateTime, PictureTime, SynchDelay, SynchPulseWidth, TriggerInDelay);

if return_seqtiming == 0
    fprintf('%d : seqtiming - Successfull execution. \n',return_seqtiming)
elseif return_seqtiming == 1003
    fprintf('%d : seqtiming - The specified ALP identifier is not valid. \n', return_seqtiming)
elseif return_seqtiming == 1004
    fprintf('%d : seqtiming - The specified ALP is already allocated. \n', return_seqtiming)
elseif return_seqtiming == 1005
   fprintf('%d : seqtiming - One of the parameters is invalid. \n.', return_seqtiming)
elseif return_seqtiming == 1008
   fprintf('%d : seqtiming - The sequence specified is currently in use. \n.', return_seqtiming)
else
    fprintf('seqtiming error code: %d. \n',return_seqtiming)
end
end