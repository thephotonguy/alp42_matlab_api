%seqput() - This function allows loading user supplied data via the USB connection into the ALP memory of a 
% previously allocated sequence (AlpSeqAlloc) or a part of such a sequence
%INPUTS:
%PicOffset: Picture number in the sequence (starting at 0) where the data upload is started; 
%PicLoad: number of pictures that are to be loaded into the sequence memory
%image: user data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function seqput(dll_name,hdevice,SequenceId,PicOffset,PicLoad,img)

image = uint8(img);
PicOffset = int32(PicOffset); %Picture number in the sequence
PicLoad = int32(PicLoad); %number of pictures that are to be loaded into the sequence memory
imagePtr = libpointer('uint8Ptr',image);
[return_seqput] = calllib(dll_name,'AlpSeqPut', hdevice, SequenceId, PicOffset, PicLoad, imagePtr);
errval = errorcheck(return_seqput);
if errval == 1
    seqfree(dll_name,hdevice,SequenceId);
    devfree(hdevice);
    unloadlibrary alpV42
end
end
