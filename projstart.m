%projstart() - to start the continuous sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function projstart(dll_name,hdevice,SequenceId)

[return_projstart] = calllib(dll_name,'AlpProjStart', hdevice, SequenceId);
errval = errorcheck(return_projstart);
if errval == 1
    devfree(hdevice)
    unloadlibrary alpV42
end
end

