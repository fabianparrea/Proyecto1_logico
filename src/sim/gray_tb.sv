module gray_tb();

    logic s3, s2, s1, s0, b3, b2, b1, b0;
    gray dut(s3,s2,s1,s0, b3, b2, b1 ,b0);


    initial begin
    //Prueba 1 Gray:0000/Binario:0000
    s3 = 0; s2 = 0; s1 = 0; s0 = 0 ; #10;
    //Prueba 2 Gray:0001/Binario:0001
    s3 = 0; s2 = 0; s1 = 0; s0 = 1; #10;
    //Prueba 3 Gray:0011/Binario:0010
    s3 = 0; s2 = 0; s1 = 1; s0 = 1 ; #10;
    //Prueba 4 Gray:0010/Binario:0011
    s3 = 0; s2 = 0; s1 = 1; s0 = 0 ; #10;
    //Prueba 5 Gray:0110/Binario:0100
    s3 = 0; s2 = 1; s1 = 1; s0 = 0 ; #10;
    //Prueba 6 Gray:0111/Binario:0101
    s3 = 0; s2 = 1; s1 = 1; s0 = 1 ; #10;
    //Prueba 7 Gray:0101/Binario:0110
    s3 = 0; s2 = 1; s1 = 0; s0 = 1 ; #10;
    //Prueba 8 Gray:0100/Binario:0111
    s3 = 0; s2 = 1; s1 = 0; s0 = 0 ; #10;
    //Prueba 9 Gray:1100/Binario:1000
    s3 = 1; s2 = 1; s1 = 0; s0 = 0 ; #10;
    //Prueba 10 Gray:1101/Binario:1001
    s3 = 1; s2 = 1; s1 = 0; s0 = 1 ; #10;
    //Prueba 11 Gray:1111/Binario:1010
    s3 = 1; s2 = 1; s1 = 1; s0 = 1 ; #10;
    //Prueba 12 Gray:1110/Binario:1011
    s3 = 1; s2 = 1; s1 = 1; s0 = 0 ; #10;
    //Prueba 13 Gray:1010/Binario:1100
    s3 = 1; s2 = 0; s1 = 1; s0 = 0 ; #10;
    //Prueba 14 Gray:1011/Binario:1101
    s3 = 1; s2 = 0; s1 = 1; s0 = 1 ; #10;
    //Prueba 15 Gray:1001/Binario:1110
    s3 = 1; s2 = 0; s1 = 0; s0 = 1 ; #10;
    //Prueba 16 Gray:1000/Binario:1111
    s3 = 1; s2 = 0; s1 = 0; s0 = 0 ;

    end

    initial begin
        $display("Empezando simulacion");

        #170;

        $display("Finalizando simulacion");
        $finish;
    end




    initial begin
        $dumpfile("gray_tb.vcd");
        $dumpvars(0,gray_tb);

    end


endmodule