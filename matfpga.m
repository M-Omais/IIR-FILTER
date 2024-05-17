function matfpga(com_port, baud_rate,sending_data)
    % Open the serial port
    s = serial(com_port, 'BaudRate', baud_rate);
    fopen(s);
    fprintf(s, '%s', sending_data);
    % Receive data
    data_received = fscanf(s);
    disp(['Received data: ', data_received]);
    fclose(s);
    delete(s);
end
