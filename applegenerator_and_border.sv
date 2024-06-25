`default_nettype none
// Empty top module

// make another always_ff block: feed good collision through synchronizer, 
// make positive edge detector, 
// set next_apple_set to zero if there is a rising edge on good collision

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

module applegenerator (

input logic [3:0] x, y, randX, randY, 
input logic goodColl, clk, reset, s_reset, 
input logic [7:0][MAX_LENGTH:0]body,
output logic apple

);

logic [7:0] apple_cord, next_apple_cord; 
logic Signal;
logic appleSet, next_apple_set, nextApple;
synchronizer toNextApple (.clk(clk), .reset(reset), .goodColl(goodColl), .Signal(Signal));

always_comb 
begin
    next_apple_set = appleSet; 
    next_apple_cord = apple_cord;
    nextApple = apple;

if (apple_cord == {x,y}) begin
nextApple = 1;
end

if (Signal == 1) begin
next_apple_set = 0;
end

if(goodColl == 1 && appleSet == 0) begin
    next_apple_cord = {randX, randY};
    next_apple_set = 1;
    
    for(int i = 0; i<MAX_LENGTH; i++) begin
        if(next_apple_cord == body[i]) begin
            next_apple_set = 0;
        end
    end
end
else begin
    next_apple_cord = apple_cord;
    next_apple_set = appleSet;
end
end


always_ff @(posedge clk, negedge reset)
begin
if (~reset) begin
apple_cord <= 8'b11000101;
appleSet <= 1; 
apple <= 0;
else begin
    apple_cord <= next_apple_cord;
    appleSet <= next_apple_set;
    apple <= nextApple;
end
end
end

endmodule




