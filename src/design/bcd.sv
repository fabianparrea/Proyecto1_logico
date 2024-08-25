module bcd(input logic [3:0] s,
            output logic [7:0] w);

    
    logic a, b, c, d;
    logic [7:0] y;
    

    gray conv(s[3], s[2], s[1], s[0], a, b, c, d);

    assign y[7:5] = 0;
    assign y[4] =  a & (b | c); 
    assign y[3] = a & b & ~c;
    assign y[2] = b & (~a | c);
    assign y[1] =  ~a & c;
    assign y[0] = d;


    assign w = {y[7:0]};

endmodule


