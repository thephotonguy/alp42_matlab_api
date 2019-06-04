%projstart() - to start the continuous sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [return_projstart] = projstart(dll_name,hdevice,SequenceId)

[return_projstart] = calllib(dll_name,'AlpProjStart', hdevice, SequenceId);
errorcheck(return_projstart)
end

