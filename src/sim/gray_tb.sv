module gray_tb();

    logic s3, s2, s1, s0, b3, b2, b1, b0;
    gray dut(s3,s2,s1,s0, b3, b2, b1 ,b0);


    initial begin
    
    s3 = 0; s2 = 0; s1 = 0; s0 = 0 ; #10;

    s3 = 0; s2 = 1; s1 = 0; s0 = 1; #10;


    end

    initial begin
        $display("Empezando simulacion");

        #30;

        $display("Finalizando simulacion");
        $finish;
    end




    initial begin
        $dumpfile("gray_tb.vcd");
        $dumpvars(0,gray_tb);

    end


endmodule