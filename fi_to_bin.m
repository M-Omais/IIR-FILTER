function [y] = fi_to_bin(x)
    
% Define the fixed-point format
word_length = 16;       % Total number of bits
fraction_length = 11;   % Number of fractional bits
signed = true;          % Signed fixed-point representation
fixed_point_number = fi(x, signed, word_length, fraction_length);
y = bin(fixed_point_number);
end