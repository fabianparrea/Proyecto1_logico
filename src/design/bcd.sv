module bcd(input logic s3, s2, s1, s0,
            output logic w);

    
    logic a, b, c, d;
    logic [7:0] y;
    

    gray conv(s3, s2, s1, s0, a, b, c, d); 
    assign y[7:5] = 0;
    assign y[4] =  c & a | a & b; 
    assign y[3] = a & ~b & ~c;
    assign y[2] = ~a & b | c;
    assign y[1] = ~a & c | a & ~b & ~c;
    assign y[0] = d;

    assign w = {y[7:0]};





endmodule


