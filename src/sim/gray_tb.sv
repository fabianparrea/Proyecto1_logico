module gray_tb();

    logic [3:0] s;
    logic b3, b2, b1, b0;
    gray dut(.s(s), .b3(b3), .b2(b2), .b1(b1) ,.b0(b0));


    initial begin
    //Prueba 0
        s = 4'b0000; #10; //Gray: 0
        //Prueba 1
        s = 4'b0001; #10; //Gray: 1
        //Prueba 2
        s = 4'b0011; #10; //Gray: 2
        //Prueba 3
        s = 4'b0010; #10; //Gray: 3
        //Prueba 4
        s = 4'b0110; #10; //Gray: 4
        //Prueba 5
        s = 4'b0111; #10; //Gray: 5
        //Prueba 6
        s = 4'b0101; #10; //Gray: 6
        //Prueba 7
        s = 4'b0100; #10; //Gray: 7
        //Prueba 8
        s = 4'b1100; #10; //Gray: 8
        //Prueba 9
        s = 4'b1101; #10; //Gray: 9
        //Prueba 10
        s = 4'b1111; #10; //Gray: 10
        //Prueba 11
        s = 4'b1110; #10; //Gray: 11
        //Prueba 12
        s = 4'b1010; #10; //Gray: 12
        //Prueba 13
        s = 4'b1011; #10; //Gray: 13
        //Prueba 14
        s = 4'b1001; #10; //Gray: 14
        //Prueba 15
        s = 4'b1000; //Gray: 15

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