clear sending
sending = serialport("COM12", 9600);

% Open the file in binary mode
fileID = fopen('input.bin', 'rb');
% Read the entire file into a buffer
fileData = uint8(fread(fileID))-48;
fclose(fileID);
fopen("output.txt", 'w');  % Open the file for writing
%Process the buffer
numLines = length(fileData) / 16; % Assuming each line is 16 bytes
for lineNum = 1:numLines
    start = (lineNum - 1) * 16 + 1;
    stop = start + 15;
    highByte = fileData(start)*2^7+fileData(start+1)*2^6+fileData(start+2)*2^5+fileData(start+3)*2^4+fileData(start+4)*2^3+ fileData(start+5)*2^2 + fileData(start+6)*2^1+fileData(start+7)*2^0;
    lowByte = fileData(start+8)*2^7+fileData(start+9)*2^6+fileData(start+10)*2^5+fileData(start+11)*2^4+fileData(start+12)*2^3+ fileData(start+13)*2^2 + fileData(start+14)*2^1+fileData(start+15)*2^0;

    write(sending, highByte, "uint8");
    data1 = read(sending, length(highByte), "uint8");
    write(sending, lowByte, "uint8");
    data2 = read(sending, length(lowByte), "uint8");
    data=data1*2^8+data2;
        fprintf(fopen("output.txt", 'a'), '%d\n', data);  % Write binary string to file
end
fclose("all");