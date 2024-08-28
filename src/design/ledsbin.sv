module ledsbin(input logic [3:0] s,
                output logic led3, led2, led1, led0);
    
    logic inv_led3, inv_led2, inv_led1, inv_led0;

    gray ledon(s, inv_led3, inv_led2, inv_led1, inv_led0);

    assign led3 = ~inv_led3;
    assign led2 = ~inv_led2;
    assign led1 = ~inv_led1;
    assign led0 = ~inv_led0;

endmodule


