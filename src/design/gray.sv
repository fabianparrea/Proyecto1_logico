module gray(input logic [3:0] s,
            output logic b3, b2, b1, b0);

    
    assign b3 = s[3];
    assign b2 = s[2]^b3;
    assign b1 = s[1]^b2;
    assign b0 = s[0]^b1;

endmodule





