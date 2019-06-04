function [return_seqfree] = seqfree(dll_name,hdevice,SequenceId)

[return_seqfree] = calllib(dll_name,'AlpSeqFree',hdevice, SequenceId);

if return_seqfree == 0
    fprintf('%d : seqfree - Successfull execution. \n',return_seqfree)
elseif return_seqfree == 1003
    fprintf('%d : seqfree - The specified ALP identifier is not valid. \n', return_seqfree)
elseif return_seqfree == 1004
    fprintf('%d : seqfree - The specified ALP is already allocated. \n', return_seqfree)
elseif return_seqfree == 1002
    fprintf('%d : seqfree - The ALP is not in idle state. \n', return_seqfree)
elseif return_seqfree == 1005
   fprintf('%d : seqfree - One of the parameters is invalid. \n.', return_seqfree)
elseif return_seqfree == 1008
   fprintf('%d : seqfree - The sequence specified is currently in use. \n.', return_seqfree)
else
    fprintf('seqfree error code: %d. \n',return_seqfree)
end
end