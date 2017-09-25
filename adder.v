// Adder circuit
`define XOR xor #50
`define AND and #50
`define OR or #50

module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    wire ab_xor;
    wire ab;
    wire bc;
    wire ac;
    wire abbc;
    `XOR xor0(ab_xor, a, b);
    `XOR xor1(sum, ab_xor, carryin);
    `AND and0(ab, a, b);
    `AND and1(bc, b, carryin);
    `AND and2(ac, a, carryin);
    `OR or0(abbc, ab, bc);
    `OR or1(carryout, abbc, ac);
endmodule
