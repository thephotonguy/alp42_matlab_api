%seqtiming() - This function controls the timing properties of the sequence display

%INPUTS:
%IlluminateTime - duration of the display of one picture in the sequence.
%PictureTime - time between the start of two consecutive pictures (i.e. this parameter defines the image display rate
%SynchDelay - specifies the time between start of the frame synch output pulse and the start of the display. 
%SynchPulseWidth - specifies the duration of the frame synch output pulse.
%TriggerInDelay - specifies the time between the incoming trigger edge and the start of the display. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function seqtiming(dll_name,hdevice,SequenceId,IlluminateTime,PictureTime,SynchDelay,SynchPulseWidth,TriggerInDelay)
IlluminateTime = int32(IlluminateTime);
PictureTime = int32(PictureTime);
SynchDelay = int32(SynchDelay);
SynchPulseWidth = int32(SynchPulseWidth);
TriggerInDelay = int32(TriggerInDelay);
[return_seqtiming] = calllib(dll_name,'AlpSeqTiming', hdevice, SequenceId, IlluminateTime, PictureTime, SynchDelay, SynchPulseWidth, TriggerInDelay);
errorcheck(return_seqtiming);
end