% Define a floating-point number
floating_point_number = 0.993226522866149;

% Define the fixed-point format
word_length = 16;       % Total number of bits
fraction_length = 11;   % Number of fractional bits
signed = true;          % Signed fixed-point representation

% Convert floating-point to fixed-point

fixed_point_number = fi(floating_point_number, signed, word_length, fraction_length);

% Display the fixed-point number in binary format
binary_representation = bin(fixed_point_number)
