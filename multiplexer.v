// Multiplexer circuit
`define AND and #50
`define NOT not #50
`define OR or #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    wire n0;
    wire n1;
    wire p_out0;
    wire p_out1;
    wire p_out2;
    wire p_out3;
    wire e_out0;
    wire e_out1;
    wire e_out2;
    wire e_out3;
    wire e_out01;
    wire e_out23;
    `NOT Ainv(n0, address0);
    `NOT Binv(n1, address1);
    `AND and0(p_out0, n0, n1);
    `AND and1(p_out1, address0, n1);
    `AND and2(p_out2, n0, address1);
    `AND and3(p_out3, address0, address1);
    `AND enable0(e_out0, in0, p_out0);
    `AND enable1(e_out1, in1, p_out1);
    `AND enable2(e_out2, in2, p_out2);
    `AND enable3(e_out3, in3, p_out3);
    `OR or01(e_out01, e_out0, e_out1);
    `OR or23(e_out23, e_out2, e_out3);
    `OR or0123(out, e_out01, e_out23);
endmodule
