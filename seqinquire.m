%seqinquire() - This function provides information about the settings of
%the specified picture sequence.

%INPUTS:
%Seq_InquireType - specifies the sequence parameter setting to inquire. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[return_seqinquire,Seq_UserVar] = seqinquire(dll_name,hdevice,SequenceId,Seq_InquireType)
Seq_InquireType = int32(Seq_InquireType);
Seq_UserVar = int32(0);
Seq_UserVarPtr = libpointer('int32Ptr',Seq_UserVar);
[return_seqinquire,Seq_UserVar] = calllib(dll_name,'AlpSeqInquire',hdevice, SequenceId, Seq_InquireType, Seq_UserVarPtr);

if return_seqinquire == 0
    fprintf('%d : seqinquire - Successfull execution. \n',return_seqinquire)
elseif return_seqinquire == 1003
    fprintf('%d : seqinquire - The specified ALP identifier is not valid. \n', return_seqinquire)
elseif return_seqinquire == 1005
   fprintf('%d : seqinquire - One of the parameters is invalid. \n.', return_seqinquire)
else
    fprintf('seqinquire error code: %d. \n',return_seqinquire)
end
end