%projstart() - to start the continuous sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [return_projstart] = projstartcont(dll_name,hdevice,SequenceId)

[return_projstart] = calllib(dll_name,'AlpProjStartCont', hdevice, SequenceId);

if return_projstart == 0
    fprintf('%d : projstart - Successfull execution. \n', return_projstart)
elseif return_projstart == 1003
    fprintf('%d : projstart - The specified ALP identifier is not valid. \n', return_projstart)
elseif return_projstart == 1004
    fprintf('%d : projstart - The specified ALP is already allocated. \n', return_projstart)
elseif return_projstart == 1008
    fprintf('%d : projstart - The sequence specified is currently in use. \n', return_projstart)
elseif return_projstart == 1005
   fprintf('%d : projstart - One of the parameters is invalid. \n.', return_projstart)    
elseif return_projstart == 1018
   fprintf('%d : projstart - waking up the DMD from PWR_FLOAT did not work. \n.', return_projstart)
else
    fprintf('projstart error code: %d \n.', return_projstart) 
end 
end

