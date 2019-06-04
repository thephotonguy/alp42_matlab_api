%seqput() - This function allows loading user supplied data via the USB connection into the ALP memory of a 
% previously allocated sequence (AlpSeqAlloc) or a part of such a sequence
%INPUTS:
%PicOffset: Picture number in the sequence (starting at 0) where the data upload is started; 
%PicLoad: number of pictures that are to be loaded into the sequence memory
%image: user data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [return_seqput] = seqput(dll_name,hdevice,SequenceId,PicOffset,PicLoad,img)

image = uint8(img);
PicOffset = int32(PicOffset); %Picture number in the sequence
PicLoad = int32(PicLoad); %number of pictures that are to be loaded into the sequence memory
imagePtr = libpointer('uint8Ptr',image);
[return_seqput] = calllib(dll_name,'AlpSeqPut', hdevice, SequenceId, PicOffset, PicLoad, imagePtr);

if return_seqput == 0
    fprintf('%d : seqput - Successfull execution. \n',return_seqput)
elseif return_seqput == 1003
    fprintf('%d : seqput - The specified ALP identifier is not valid. \n', return_seqput)
elseif return_seqput == 1004
    fprintf('%d : seqput - The specified ALP is already allocated. \n', return_seqput)
elseif return_seqput == 1002
    fprintf('%d : seqput - The ALP is not in idle state. \n', return_seqput)
elseif return_seqput == 1005
   fprintf('%d : seqput - One of the parameters is invalid. \n.', return_seqput)
elseif return_seqput == 1006
   fprintf('%d : seqput - Error accessing user data. \n.', return_seqput)
elseif return_seqput == 1008
   fprintf('%d : seqput - The sequence specified is currently in use. \n.', return_seqput)
elseif return_seqput == 1011
   fprintf('%d : seqput - Communication error. \n.', return_seqput)
elseif return_seqput == 1009
   fprintf('%d : seqput - The ALP has been stopped while image data transfer was active. \n.', return_seqput)
else
    fprintf('seqput error code: %d. \n',return_seqput)
end
end
