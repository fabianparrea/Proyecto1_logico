module ledsbin(input logic [3:0] s,
                output logic led3, led2, led1, led0);

    gray ledon(s, led3, led2, led1, led0);

endmodule


