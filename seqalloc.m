%seqalloc() - This function provides ALP memory for a sequence of pictures

%INPUTS: 
%BitPlanes: bit depth of the patterns to be displayed
%PicNum: number of pictures belonging to the sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[SequenceId] = seqalloc(dll_name,hdevice,BitPlanes,PicNum)

BitPlanes = int32(BitPlanes); %bit depth
PicNum = int32(PicNum);
SequenceId = uint32(0);
SequenceIdPtr = libpointer('uint32Ptr',SequenceId);
[return_seqalloc, SequenceId] = calllib(dll_name, 'AlpSeqAlloc', hdevice, BitPlanes, PicNum, SequenceIdPtr);
errval = errorcheck(return_seqalloc);
if errval == 1
    seqfree(dll_name,hdevice,SequenceId);
    devfree(hdevice);
    unloadlibrary alpV42
end
end
