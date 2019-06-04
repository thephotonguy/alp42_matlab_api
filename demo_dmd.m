
clear all
clc

dll_name = 'alpV42';
dll_header = 'alp';
loadlibrary(dll_name,dll_header)

[return_DevAlloc,hdevice] = devalloc(dll_name);


unloadlibrary alpV42