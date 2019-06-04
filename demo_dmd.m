%demo program to flash sequence of 2 images
clear all

dll_name = 'alpV42';
dll_header = 'alp';
loadlibrary(dll_name,dll_header) %Loading dll and lib

%creating black and white image sequence
im1 = zeros(1024,768);
im2 = ones(1024,768);
image = cat(3,im1,im2);
img = im2uint8(image);

%defining image parameters
BitPlanes = 1; %bit depth
PicNum = 2; %number of pictures
PicOffset = 0;%Picture number in the sequence
PicLoad = 2; %number of pictures that are to be loaded into the sequence memory
pictureTime = 500000; %display picture time in usec

%allocating the DMD
[return_DevAlloc,hdevice] = devalloc(dll_name); 

%Inquiring the DMD device serial number
[return_inquiry,return_InquireType] = devinquire(dll_name,hdevice,2000);

%sequence allocation
[return_seqalloc,SequenceId] = seqalloc(dll_name,hdevice,BitPlanes,PicNum);

%send image to the dmd
[return_seqput] = seqput(dll_name,hdevice,SequenceId,PicOffset,PicLoad,img);

%timing of the sequence
[return_seqtiming] = seqtiming(dll_name,hdevice,SequenceId,0,pictureTime,0,0,0);

%start the sequence
[return_projstart] = projstart(dll_name,hdevice,SequenceId);

%halt the display
[return_devhalt] = devhalt(dll_name,hdevice);

%free the sequence in the dmd
[return_seqfree] = seqfree(dll_name,hdevice,SequenceId);

%free the dmd
[return_devfree] = devfree(hdevice);

unloadlibrary alpV42




