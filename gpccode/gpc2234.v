module gpc223_4(input wire[2:0]src0, input wire[1:0]src1, input wire[1:0]src2, output wire[3:0]dst);
    wire[1:0] lut0_out;
    wire[1:0] lut1_out;
    wire[1:0] lut2_out;
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
    LUT5 #(
        .INIT(32'h66666666)
    ) lut1_0_inst (
        .I0(src1[0]),
        .I1(src1[1]),
        .O(lut1_out[0])
    );
    LUT5 #(
        .INIT(32'haaaaaaaa)
    ) lut1_1_inst (
        .I0(src1[0]),
        .I1(src1[1]),
        .O(lut1_out[1])
    );
    LUT5 #(
        .INIT(32'h66666666)
    ) lut2_0_inst (
        .I0(src2[0]),
        .I1(src2[1]),
        .O(lut2_out[0])
    );
    LUT5 #(
        .INIT(32'haaaaaaaa)
    ) lut2_1_inst (
        .I0(src2[0]),
        .I1(src2[1]),
        .O(lut2_out[1])
    );
    assign props[0] = lut0_out[0];
    assign props[1] = lut1_out[0];
    assign props[2] = lut2_out[0];
    assign genes[0] = lut0_out[1];
    assign genes[1] = lut1_out[1];
    assign genes[2] = lut2_out[1];
    CARRY4 CARRY4_inst (
        .CO(carry4_carryout),
        .O(carry4_out),
        .CYINIT(src0[2]),
        .DI(genes),
        .S(props)
    );
    assign dst[0] = carry4_out[0];
    assign dst[1] = carry4_out[1];
    assign dst[2] = carry4_out[2];
    assign dst[3] = carry4_carryout[2];
endmodule

