module ledsbin_tb();

    logic s3, s2, s1, s0, led3, led2, led1, led0;

    ledsbin dut(s3, s2, s1, s0, led3, led2, led1, led0);

    initial begin

        s3 = 0; s2 = 0; s1 = 0; s0 = 0 ; #10;

        s3 = 1; s2 = 1; s1 = 0; s0 = 1; #10;


    end   

    initial begin
        $display("Empezando simulacion");

        #30;

        $display("Finalizando simulacion");
        $finish;
    end




    initial begin
        $dumpfile("ledsbin_tb.vcd");
        $dumpvars(0,ledsbin_tb);

    end

endmodule