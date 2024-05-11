% Open the file for reading
file_id = fopen('output.txt', 'r');

% Initialize an empty array to store the decimal values
decimal_data = [];

% Read the file line by line
tline = fgetl(file_id);
while ischar(tline)
    % Convert the fixed-point binary to decimal
    decimal_value = fixed_to_decimal(tline);
    
    % Append the decimal value to the array
    decimal_data = [decimal_data, decimal_value];
    
    % Read the next line
    tline = fgetl(file_id);
end

figure
% Plot the decimal data
plot(decimal_data);
xlabel('Sample Index');
ylabel('Amplitude');
title('Decoded Signal');

% Function to convert fixed-point binary to decimal
function decimal_value = fixed_to_decimal(binary_string)
    % Assume 16-bit fixed-point representation with 1 sign bit,
    % 4 integer bits, and 11 fractional bits
    sign_bit = binary_string(1) - '0';
    integer_part = bin2dec(binary_string(2:5));
    fractional_part1 = bin2dec(binary_string(6:8));
    fractional_part2 = bin2dec(binary_string(9:12));
    fractional_part3 = bin2dec(binary_string(12:16));
    
    fractional_part = fractional_part1 * (2^-3) + fractional_part2 * (2^-7) + fractional_part3 * (2^-11);

    % Combine the integer and fractional parts
    decimal_value = integer_part + fractional_part;
    
    % Apply the sign
    if sign_bit
        decimal_value = -(decimal_value);
    end
end
