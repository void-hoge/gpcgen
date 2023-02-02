module gpc3_2(input wire[2:0]src0, output wire[1:0]dst);
    wire[1:0] lut0_out;
    wire[3:0] genes;
    wire[3:0] props;
    wire[3:0] carry4_out;
    wire[3:0] carry4_carryout;
    LUT5 #(
        .INIT(32'h66666666)
    ) lut0_0_inst (
        .I0(src0[0]),
        .I1(src0[1]),
        .O(lut0_out[0])
    );
    LUT5 #(
        .INIT(32'haaaaaaaa)
    ) lut0_1_inst (
        .I0(src0[0]),
        .I1(src0[1]),
        .O(lut0_out[1])
    );
    assign props[0] = lut0_out[0];
    assign genes[0] = lut0_out[1];
    CARRY4 CARRY4_inst (
        .CO(carry4_carryout),
        .O(carry4_out),
        .CI(0),
        .CYINIT(src0[2]),
        .DI(genes),
        .S(props)
    );
    assign dst[0] = carry4_out[0];
    assign dst[1] = carry4_carryout[0];
endmodule

