// Decoder circuit
`define AND and #50
`define NOT not #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    wire n0;
    wire n1;
    wire p_out0;
    wire p_out1;
    wire p_out2;
    wire p_out3;
    `NOT Ainv(n0, address0);
    `NOT Binv(n1, address1);
    `AND and0(p_out0, n0, n1);
    `AND and1(p_out1, address0, n1);
    `AND and2(p_out2, n0, address1);
    `AND and3(p_out3, address0, address1);
    `AND enable0(out0, enable, p_out0);
    `AND enable1(out1, enable, p_out1);
    `AND enable2(out2, enable, p_out2);
    `AND enable3(out3, enable, p_out3);
endmodule
