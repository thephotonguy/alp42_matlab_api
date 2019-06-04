
function [return_devhalt] = devhalt(dll_name,hdevice)
[return_devhalt] = calllib(dll_name,'AlpDevHalt', hdevice);

if return_devhalt == 0
    fprintf('%d : devhalt - Successfull execution. \n', return_devhalt)
elseif return_devhalt == 1003
    fprintf('%d : devhalt - The specified ALP identifier is not valid. \n', return_devhalt)
else
    fprintf('devhalt error code: %d \n.', return_devhalt)
end