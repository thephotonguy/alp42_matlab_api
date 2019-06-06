function seqfree(dll_name,hdevice,SequenceId)
[return_seqfree] = calllib(dll_name,'AlpSeqFree',hdevice, SequenceId);
errorcheck(return_seqfree);
end