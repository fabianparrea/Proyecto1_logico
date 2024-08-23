module gray(input logic s3, s2, s1, s0,
            output logic b3, b2, b1, b0);

    
    assign b3 = s3;
    assign b2 = s2^b3; 
    assign b1 = s1^b2;
    assign b0 = s0^b1;

endmodule





