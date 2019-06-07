%DevInquire - This function inquires a parameter setting of the specified ALP device
%Inquire Type: 
% ALP_DEVICE_NUMBER		2000L	Serial number of the ALP device 
% ALP_VERSION			2001L	Version number of the ALP device 
% ALP_DEV_STATE			2002L	current ALP status 
% ALP_AVAIL_MEMORY		2003L	ALP on-board sequence memory available for further sequence 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%										
function [return_InquireType] = devinquire(dll_name,hdevice,InquireType)

InquireType = int32(InquireType); %specifies the ALP device parameter setting to inquire; refer to pg no 8 in the api document
return_InquireType = int32(0);
return_inquireptr = libpointer('int32Ptr', return_InquireType);
[return_inquiry, return_InquireType] = calllib(dll_name, 'AlpDevInquire', hdevice, InquireType , return_inquireptr);
errval = errorcheck(return_inquiry);
if errval == 1
    devfree(hdevice)
    unloadlibrary alpV42
end
end
