
function devhalt(dll_name,hdevice)
[return_devhalt] = calllib(dll_name,'AlpDevHalt', hdevice);
errorcheck(return_devhalt)
end