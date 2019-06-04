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
errorcheck(return_seqalloc)
end
