

module synchronizer (
    input logic clk, goodColl, reset,
    output logic edgee);

    logic [1:0] signal;

always_ff @(posedge clk, negedge reset) begin
if (~reset == 1) begin
    signal <= 0; // later, link the signal to the next_apple_set
end

else begin
signal [0] <= goodColl;
signal [1] <= signal [0];
end

end

assign edgee = signal [0] && ~signal[1];

endmodule