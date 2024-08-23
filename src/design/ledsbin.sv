module ledsbin(input logic s3, s2, s1, s0,
                output logic led3, led2, led1, led0);

    gray ledon(s3, s2, s1, s0, led3, led2, led1, led0);

endmodule


