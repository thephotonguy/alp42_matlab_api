function devfree(hdevice)
[return_devfree] = calllib('alpV42', 'AlpDevFree', hdevice);
errorcheck(return_devfree)
end