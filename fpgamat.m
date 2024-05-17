function fpgamat(filename)
    % Open the serial port
    
    % Receive data
    data_received = fscanf(s);
    % Load existing data from the file
    if isfile(filename)
        existing_data = load(filename);
    else
        existing_data = [];
    end
    % Concatenate new data with existing data
    combined_data = [existing_data, data_received];
    % Save the combined data to the file
    save(filename, 'combined_data'); 
    fclose(s);
    delete(s);
end
