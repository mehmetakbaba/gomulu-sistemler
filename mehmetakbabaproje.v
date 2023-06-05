module dc_motor1(
    input wire clk,
    input wire motor1,
    input wire motor2,
    output wire motor_on1
);
    reg motor_state;
    
    always @(motor1, motor2) begin  
        if(motor1)
            motor_state = 1'b0;
        else if(motor2)
            motor_state = 1'b1;
        else    
            motor_state = 1'b0
    end

    assing motor_on1 = motor_state;
endmodule

module dc_motor2(
    input wire clk;
    input wire motor1,
    input motor2,
    output wire motor_on2
);

    reg motor_state;
    
    always @(motor1, motor2) begin
        if(motor1)
            motor_state = 1'b1;
        else if(motor2)
            motor_state = 1'b0;
    end
    assing motor_on2 = motor_state;
endmodule

module led(
    output reg [2:0] led,
    input wire motor1,
    input wire motor2,
    input wire clk
);

    always @(motor1, motor2) begin

        if (motor1 && !motor2)
            led = 3'b101;
        else if (!motor1 && motor2)
            led = 3'b110;
        else if (motor1 && motor2)
            led = 3'b000;
        else
            led = 3'b011;
    end

endmodule