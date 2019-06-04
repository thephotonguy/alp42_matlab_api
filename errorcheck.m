function errorcheck(returnValue)
msg = ["The specified ALP device has not been found or is not ready.","The ALP device is not in idle state.","The specified ALP device identifier is not valid.", ...
    "The specified ALP device is already allocated.","One of the parameters is invalid.","Error accessing user data.","The requested memory is not available (full?).", ....
    "The sequence specified is currently in use.","The ALP device has been stopped while image data transfer was active.","Initialization error.", ...
    "Communication error.","The specified ALP has been removed.","The onboard FPGA is unconfigured.","The function is not supported by this version of the driver file VlxUsbLd.sys.", ...
    "Waking up the DMD from PWR_FLOAT did not work (ALP_DMD_POWER_FLOAT)","Support in ALP drivers missing. Update drivers and power-cycle device.", ...
    "SDRAM Initialization failed.","Error occured not listed"];
while returnValue ~= 0
    
if returnValue == 1001
    error(msg(1))
    
elseif returnValue == 1002
        error(msg(2))
elseif returnValue == 1003
        error(msg(3))
elseif returnValue == 1004   
        error(msg(4))
elseif returnValue == 1005   
        error(msg(5))
elseif returnValue == 1006 
        error(msg(6))
elseif returnValue == 1007
        error(msg(7))
elseif returnValue == 1008 
        error(msg(8))
elseif returnValue == 1009 
        error(msg(9))
elseif returnValue == 1010
        error(msg(10))
elseif returnValue == 1011 
        error(msg(11))
elseif returnValue == 1012 
        error(msg(12))
elseif returnValue == 1013 
        error(msg(13))
elseif returnValue == 1014 
        error(msg(14))
elseif returnValue == 1018   
        error(msg(15))
elseif returnValue == 1019
        error(msg(16))
elseif returnValue == 1020
        error(msg(17))
else 
    error(msg(18))
end
unloadlibrary alpV42
end
end