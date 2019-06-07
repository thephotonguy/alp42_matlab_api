%projstart() - to start the continuous sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function projstartcont(dll_name,hdevice,SequenceId)
[return_projstartcont] = calllib(dll_name,'AlpProjStartCont', hdevice, SequenceId);
errval = errorcheck(return_projstartcont);
if errval == 1
    devfree(hdevice)
    unloadlibrary alpV42
end
end

