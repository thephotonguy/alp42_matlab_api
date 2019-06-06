%seqinquire() - This function provides information about the settings of
%the specified picture sequence.

%INPUTS:
%Seq_InquireType - specifies the sequence parameter setting to inquire. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[Seq_UserVar] = seqinquire(dll_name,hdevice,SequenceId,Seq_InquireType)
Seq_InquireType = int32(Seq_InquireType);
Seq_UserVar = int32(0);
Seq_UserVarPtr = libpointer('int32Ptr',Seq_UserVar);
[return_seqinquire,Seq_UserVar] = calllib(dll_name,'AlpSeqInquire',hdevice, SequenceId, Seq_InquireType, Seq_UserVarPtr);
errorcheck(return_seqinquire);
end