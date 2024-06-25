

module synchronizerTestBench ();

    logic [1:0] signal;
    logic clk, goodColl, reset, edgee;

synchronizer dut(clk; goodColl; reset);

initial begin 
    clk = 1; goodColl = 1; reset = 0;
    @(posedge clk);
    assert (edgee === 1) else $error("110 failed")

    clk = 0; goodColl = 0; reset = 1; 
    @(posedge clk);
    assert (edgee === 0) else $error("110 failed")
    
end

endmodule