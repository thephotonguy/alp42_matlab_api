%DevInquire - This function inquires a parameter setting of the specified ALP device
%Inquire Type: 
% ALP_DEVICE_NUMBER		2000L	Serial number of the ALP device 
% ALP_VERSION			2001L	Version number of the ALP device 
% ALP_DEV_STATE			2002L	current ALP status 
% ALP_AVAIL_MEMORY		2003L	ALP on-board sequence memory available for further sequence 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%										
function [return_inquiry,return_InquireType] = devinquire(dll_name,hdevice,InquireType)

InquireType = int32(InquireType); %specifies the ALP device parameter setting to inquire; refer to pg no 8 in the api document
return_InquireType = int32(0);
return_inquireptr = libpointer('int32Ptr', return_InquireType);
[return_inquiry, return_InquireType] = calllib(dll_name, 'AlpDevInquire', hdevice, InquireType , return_inquireptr);

if return_inquiry == 0
    fprintf('%d : devinquire - Successfull execution. \n', return_inquiry)
elseif return_inquiry == 1003
   fprintf('%d : devinquire - The specified ALP identifier is not valid. \n.', return_inquiry)
elseif return_inquiry == 1005
   fprintf('%d : devinquire - One of the parameters is invalid. \n.', return_inquiry)
elseif return_inquiry == 1001
    fprintf('%d : devinquire - The specified ALP has not been found or is not ready. \n', return_inquiry)
elseif return_inquiry == 1006
    fprintf('%d : devinquire - Error accessing user data. \n', return_inquiry)
elseif return_inquiry == 1012
    fprintf('%d : devinquire - The specified ALP has been removed. \n', return_inquiry)
else
    fprintf('devinquire error code: %d \n.', return_inquiry)
end
end
