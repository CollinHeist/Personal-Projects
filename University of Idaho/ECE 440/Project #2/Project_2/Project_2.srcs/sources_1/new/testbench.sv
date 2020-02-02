`timescale 1ns / 1ps

module testbench();
    parameter CLK_PRD = 100;
    parameter HOLD_TIME = (CLK_PRD * 0.3);
    parameter MAX_SIM_TIME = (100 * CLK_PRD);
    
    // Internal logic signals
    logic clock, reset, load, done;
    logic [7:0] data, gcd_result;
    
    // Instantiate the GCD core as a UUT
    gcd_core uut(.*);
    
    initial #(MAX_SIM_TIME) $finish;
    
    initial begin
        clock <= 0;
        forever #(CLK_PRD / 2) clock = ~clock;
    end 
    
    initial begin
        reset = 0; load = 0;
        data = 8'bx;
        
        // Global Reset
        #100;
        
        // Stimulate
        @(posedge clock);
        
        #HOLD_TIME;

        repeat(2) #CLK_PRD;
        reset = 1; #CLK_PRD; reset = 0;
        
        // Assert Load, X, Y
        load = 1;               #CLK_PRD;
        load = 0; data = 8'd63; #CLK_PRD;
        data = 8'd12;           #CLK_PRD;
        
        begin: run_loop
            forever begin
                @(posedge clock);
                if (done) begin
                    reset = 1; #CLK_PRD;
                    $finish;
                end
            end
        end
        
        $finish;
    end
endmodule
