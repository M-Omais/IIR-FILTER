// module FILTER (
//     input clk,
//     input rst,
//     input signed [16:0] passband_ripple, // (17-bit signed)
//     input signed [16:0] stopband_attenuation, // (17-bit signed)
//     input signed [16:0] passband_edge_freq, // (17-bit signed)
//     input signed [16:0] stopband_edge_freq, // (17-bit signed)
//     input signed [16:0] sampling_freq, // (17-bit signed)
//     input [3:0] filter_order
// );

//     reg signed [16:0] Wp,Ws,omega_p,omega_s;

//     parameter C1 = 17'b11001001000111111; 
//     parameter C2 = 17'b00000000000111111;

//     // Approximation of tan()
//     function [16:0] tan;
//         input [16:0] x;
//         begin
//             if (x > 16'b01111111111111111) // Check if x > pi/2
//                 tan = 17'h7FFF; // Max positive value
//             else if (x < 17'b1000000000000000) // Check if x < -pi/2
//                 tan = -17'h7FFF; // Max negative value
//             else begin
//                 tan = (x * C1) / C2;
//             end
//         end
//     endfunction

//     always @* begin
//         omega_p = (2'b10 * C1 * passband_edge_freq) / sampling_freq;
//         omega_s = (2'b10 * C1 * stopband_edge_freq) / sampling_freq;
//         Wp = 2'b10 * sampling_freq * tan(omega_p >> 2'b01);//prewraped_freq
//         Ws = 2'b10 * sampling_freq * tan(omega_s >> 2'b01);//prewrapped_freq
//     end
// endmodule