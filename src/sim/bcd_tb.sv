module bcd_tb();

    logic s3, s2, s1, s0;
    logic [7:0] w;

    bcd dut(s3, s2, s1, s0, w);

    initial begin

        s3 = 0; s2 = 0; s1 = 0; s0 = 0 ; #10;

        s3 = 1; s2 = 1; s1 = 1; s0 = 1; #10;


    end   

    initial begin
        $display("Empezando simulacion");

        #30;

        $display("Finalizando simulacion");
        $finish;
    end




    initial begin
        $dumpfile("bcd_tb.vcd");
        $dumpvars(0,bcd_tb);

    end

endmodule