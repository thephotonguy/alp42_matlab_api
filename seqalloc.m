%seqalloc() - This function provides ALP memory for a sequence of pictures

%INPUTS: 
%BitPlanes: bit depth of the patterns to be displayed
%PicNum: number of pictures belonging to the sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[return_seqalloc,SequenceId] = seqalloc(dll_name,hdevice,BitPlanes,PicNum)

BitPlanes = int32(BitPlanes); %bit depth
PicNum = int32(PicNum);
SequenceId = uint32(0);
SequenceIdPtr = libpointer('uint32Ptr',SequenceId);
[return_seqalloc, SequenceId] = calllib(dll_name, 'AlpSeqAlloc', hdevice, BitPlanes, PicNum, SequenceIdPtr);
if return_seqalloc == 0
    fprintf('%d : seqalloc - Successfull execution. \n',return_seqalloc)
elseif return_seqalloc == 1003
    fprintf('%d : seqalloc - The specified ALP identifier is not valid. \n', return_seqalloc)
elseif return_seqalloc == 1004
    fprintf('%d : seqalloc - The specified ALP is already allocated. \n', return_seqalloc)
elseif return_seqalloc == 1005
   fprintf('%d : seqalloc - One of the parameters is invalid. \n.', return_seqalloc)
elseif return_seqalloc == 1006
    fprintf('%d : seqalloc - Error accessing user data. \n', return_seqalloc)
elseif return_seqalloc == 1007
    fprintf('%d : seqalloc - The requested memory is not available. \n', return_seqalloc)
else
    fprintf('seqalloc error code: %d. \n', return_seqalloc)
end
end
