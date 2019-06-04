function [return_devfree] = devfree(hdevice)
[return_devfree] = calllib('alpV42', 'AlpDevFree', hdevice);

if return_devfree == 0
    fprintf('%d : devfree - Successfull execution. \n', return_devfree)
elseif return_devfree == 1002
   fprintf('%d : devfree - The ALP is not in idle state. \n.', return_devfree)
elseif return_devfree == 1004
    fprintf('%d : devfree - The specified ALP is already allocated. \n', return_devfree)
elseif return_devfree == 1003
    fprintf('%d : devfree - The specified ALP identifier is not valid. \n', return_devfree)
else 
    fprintf('devfree error code: %d \n.', return_devfree)
end
end