function[errval] = errorcheck(returnValue)
msg = ["The specified ALP device has not been found or is not ready.","The ALP device is not in idle state.","The specified ALP device identifier is not valid.", ...
    "The specified ALP device is already allocated.","One of the parameters is invalid.","error accessing user data.","The requested memory is not available (full?).", ....
    "The sequence specified is currently in use.","The ALP device has been stopped while image data transfer was active.","Initialization error.", ...
    "Communication error.","The specified ALP has been removed.","The onboard FPGA is unconfigured.","The function is not supported by this version of the driver file VlxUsbLd.sys.", ...
    "Waking up the DMD from PWR_FLOAT did not work (ALP_DMD_POWER_FLOAT)","Support in ALP drivers missing. Update drivers and power-cycle device.", ...
    "SDRAM Initialization failed.","error occured not listed"];
if returnValue ~= 0
    
if returnValue == 1001
    disp(msg(1))
    
elseif returnValue == 1002
        disp(msg(2))
elseif returnValue == 1003
        disp(msg(3))
elseif returnValue == 1004   
        disp(msg(4))
elseif returnValue == 1005   
        disp(msg(5))
elseif returnValue == 1006 
        disp(msg(6))
elseif returnValue == 1007
        disp(msg(7))
elseif returnValue == 1008 
        disp(msg(8))
elseif returnValue == 1009 
        disp(msg(9))
elseif returnValue == 1010
        disp(msg(10))
elseif returnValue == 1011 
        disp(msg(11))
elseif returnValue == 1012 
        disp(msg(12))
elseif returnValue == 1013 
        disp(msg(13))
elseif returnValue == 1014 
        disp(msg(14))
elseif returnValue == 1018   
        disp(msg(15))
elseif returnValue == 1019
        disp(msg(16))
elseif returnValue == 1020
        disp(msg(17))
else 
    disp(msg(18))
end

end

if returnValue ~= 0
    errval =1;
else
    errval = 0;
end
    
end