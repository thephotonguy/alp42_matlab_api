%projstart() - to start the continuous sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function projstartcont(dll_name,hdevice,SequenceId)
[return_projstartcont] = calllib(dll_name,'AlpProjStartCont', hdevice, SequenceId);
errorcheck(return_projstartcont);
end

