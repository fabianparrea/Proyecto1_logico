module bcd_tb();

    logic [3:0]s;
    logic [7:0]w;

    bcd dut( .s(s), .w(w));

    initial begin
        $monitor("Gray: %b | (BCD): %b", s, w);

        //Prueba 1
        s = 4'b0000; #10; //Gray: 0, decenas:0 , unidades: 0

        //Prueba 2
        s = 4'b0100; #10; //Gray: 7, decenas:0 , unidades: 7

        //Prueba 3
        s = 4'b1010; #10; //Gray: 12, decenas:1 , unidades: 2

        //Prueba 4
        s = 4'b1111; #10; //Gray: 10, decenas:1 , unidades: 0

    end   

    initial begin
        $display("Empezando simulacion");

        #80;

        $display("Finalizando simulacion");
        $finish;
    end




    initial begin
        $dumpfile("bcd_tb.vcd");
        $dumpvars(0,bcd_tb);

    end

endmodule