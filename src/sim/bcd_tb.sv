module bcd_tb();

    logic [3:0]s;
    logic [7:0]w;

    bcd dut( .s(s), .w(w));

    initial begin
        $monitor("Gray: %b | (BCD): %b", s, w);

        //Prueba 0
        s = 4'b0000; #10; //Gray: 0, decenas:0 , unidades: 0
        //Prueba 1
        s = 4'b0001; #10; //Gray: 1, decenas:0 , unidades: 1
        //Prueba 2
        s = 4'b0011; #10; //Gray: 2, decenas:0 , unidades: 2
        //Prueba 3
        s = 4'b0010; #10; //Gray: 3, decenas:0 , unidades: 3
        //Prueba 4
        s = 4'b0110; #10; //Gray: 4, decenas:0 , unidades: 4
        //Prueba 5
        s = 4'b0111; #10; //Gray: 5, decenas:0 , unidades: 5
        //Prueba 6
        s = 4'b0101; #10; //Gray: 6, decenas:0 , unidades: 6
        //Prueba 7
        s = 4'b0100; #10; //Gray: 7, decenas:0 , unidades: 7
        //Prueba 8
        s = 4'b1100; #10; //Gray: 8, decenas:0 , unidades: 8
        //Prueba 9
        s = 4'b1101; #10; //Gray: 9, decenas:0 , unidades: 9
        //Prueba 10
        s = 4'b1111; #10; //Gray: 10, decenas:1 , unidades: 0
        //Prueba 11
        s = 4'b1110; #10; //Gray: 11, decenas:1 , unidades: 1
        //Prueba 12
        s = 4'b1010; #10; //Gray: 12, decenas:1 , unidades: 2
        //Prueba 13
        s = 4'b1011; #10; //Gray: 13, decenas:1 , unidades: 3
        //Prueba 14
        s = 4'b1001; #10; //Gray: 14, decenas:1 , unidades: 4
        //Prueba 15
        s = 4'b1000; //Gray: 15, decenas:1 , unidades: 5
    end   

    initial begin
        $display("Empezando simulacion");

        #160;

        $display("Finalizando simulacion");
        $finish;
    end




    initial begin
        $dumpfile("bcd_tb.vcd");
        $dumpvars(0,bcd_tb);

    end

endmodule