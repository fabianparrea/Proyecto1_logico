module segm(input logic [3:0] s, 
            input logic bot,
            output logic a, b, c, d, e, f, g, an0, an1); // inputs 4 bits iniciales y s boton de cambio (dec/uni)

    assign an0 = 0;
    assign an1 = 0;
 
    logic [7:0] y;  //defino a y que va a pasar por el modulo del bcd
    logic [3:0] bitselec; //defino a la variable que elige los 4 bits de decenas o unidades

    bcd disp(s[3:0], y[7:0]);
    

    assign bitselec = bot ? y[3:0] : y[7:4];  //mux para asignar a bitselec decenas o unidades


    logic a1, b1, c1, d1;       // a partir de aqui logica booleana para cada salida del 7 segm
    assign {a1, b1, c1, d1} = bitselec;



    assign a = ~a1 & ~b1 & ~c1 & d1 | ~a1 & b1 & ~c1 & ~d1 | a1 & b1 & c1 & ~d1 | a1 & ~b1 & c1 & d1;

    assign b = (~a1 & b1 & ~c1 & d1) | (~a1 & b1 & c1 & ~d1);

    assign c = (~a1 & ~b1 & c1 & ~d1);

    assign d = (~a1 & ~b1 & ~c1 & d1) | (~a1 & ~b1 & c1 & ~d1) | (~a1 & b1 & ~c1) | (a1 & ~b1 & ~d1);

    assign e = (~a1 & ~b1 & ~c1) | (~a1 & b1 & c1 & d1) | (a1 & ~b1 & d1) | (a1 & b1 & ~c1 & ~d1);

    assign f = ~a1 & ~b1 & d1 | ~a1 & ~b1 & c1 | ~a1 & c1 & d1 | a1 & b1 & ~c1 | ~b1 & c1 & d1;

    assign g = ~a1 & ~b1 & ~c1 | ~a1 & b1 & c1 & d1 | a1 & ~b1 & c1;

endmodule