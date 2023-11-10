module gpc607_5(input wire[6:0]src0, input wire[5:0]src2, output wire[4:0]dst);
    wire[1:0] lut0_out;
    wire[1:0] lut1_out;
    wire[1:0] lut2_out;
    wire[1:0] lut3_out;
    wire[3:0] genes;
    wire[3:0] props;
    wire[3:0] carry4_out;
    wire[3:0] carry4_carryout;
    LUT6_2 #(
        .INIT(64'h6996966996696996)
    ) lut0_inst (
        .I0(src0[0]),
        .I1(src0[1]),
        .I2(src0[2]),
        .I3(src0[3]),
        .I4(src0[4]),
        .I5(src0[5]),
        .O6(lut0_out[0]),
        .O5(lut0_out[1])
    );
    LUT5 #(
        .INIT(32'h177e7ee8)
    ) lut1_0_inst (
        .I0(src0[0]),
        .I1(src0[1]),
        .I2(src0[2]),
        .I3(src0[3]),
        .I4(src0[4]),
        .O(lut1_out[0])
    );
    LUT5 #(
        .INIT(32'he8e8e8e8)
    ) lut1_1_inst (
        .I0(src0[0]),
        .I1(src0[1]),
        .I2(src0[2]),
        .I3(src0[3]),
        .I4(src0[4]),
        .O(lut1_out[1])
    );
    LUT6_2 #(
        .INIT(64'h6996966996696996)
    ) lut2_inst (
        .I0(src2[0]),
        .I1(src2[1]),
        .I2(src2[2]),
        .I3(src2[3]),
        .I4(src2[4]),
        .I5(src2[5]),
        .O6(lut2_out[0]),
        .O5(lut2_out[1])
    );
    LUT5 #(
        .INIT(32'h177e7ee8)
    ) lut3_0_inst (
        .I0(src2[0]),
        .I1(src2[1]),
        .I2(src2[2]),
        .I3(src2[3]),
        .I4(src2[4]),
        .O(lut3_out[0])
    );
    LUT5 #(
        .INIT(32'he8e8e8e8)
    ) lut3_1_inst (
        .I0(src2[0]),
        .I1(src2[1]),
        .I2(src2[2]),
        .I3(src2[3]),
        .I4(src2[4]),
        .O(lut3_out[1])
    );
    assign props[0] = lut0_out[0];
    assign props[1] = lut1_out[0];
    assign props[2] = lut2_out[0];
    assign props[3] = lut3_out[0];
    assign genes[0] = lut0_out[1];
    assign genes[1] = lut1_out[1];
    assign genes[2] = lut2_out[1];
    assign genes[3] = lut3_out[1];
    CARRY4 CARRY4_inst (
        .CO(carry4_carryout),
        .O(carry4_out),
        .CYINIT(src0[6]),
        .DI(genes),
        .S(props)
    );
    assign dst[0] = carry4_out[0];
    assign dst[1] = carry4_out[1];
    assign dst[2] = carry4_out[2];
    assign dst[3] = carry4_out[3];
    assign dst[4] = carry4_carryout[3];
endmodule

