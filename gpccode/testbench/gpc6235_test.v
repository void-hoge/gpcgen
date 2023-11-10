module tester();
    reg[2:0] src0;
    reg[1:0] src1;
    reg[5:0] src2;
    wire[4:0] dst;
    wire[4:0] srcsum;
    gpc623_5 gpc(
        src0, src1, src2, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src1[0]*2+src1[1]*2+src2[0]*4+src2[1]*4+src2[2]*4+src2[3]*4+src2[4]*4+src2[5]*4;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 3'h1;
        src1 <= 2'h2;
        src2 <= 6'h2d;
        #1
        src0 <= 3'h7;
        src1 <= 2'h3;
        src2 <= 6'hb;
        #1
        src0 <= 3'h5;
        src1 <= 2'h1;
        src2 <= 6'h2c;
        #1
        src0 <= 3'h1;
        src1 <= 2'h3;
        src2 <= 6'h3d;
        #1
        src0 <= 3'h6;
        src1 <= 2'h0;
        src2 <= 6'h21;
        #1
        src0 <= 3'h6;
        src1 <= 2'h0;
        src2 <= 6'h2d;
        #1
        src0 <= 3'h3;
        src1 <= 2'h2;
        src2 <= 6'h1e;
        #1
        src0 <= 3'h2;
        src1 <= 2'h2;
        src2 <= 6'h8;
        #1
        src0 <= 3'h7;
        src1 <= 2'h1;
        src2 <= 6'h3e;
        #1
        src0 <= 3'h7;
        src1 <= 2'h2;
        src2 <= 6'h3c;
        #1
        src0 <= 3'h7;
        src1 <= 2'h2;
        src2 <= 6'h2a;
        #1
        src0 <= 3'h0;
        src1 <= 2'h0;
        src2 <= 6'h22;
        #1
        src0 <= 3'h2;
        src1 <= 2'h2;
        src2 <= 6'h1f;
        #1
        src0 <= 3'h4;
        src1 <= 2'h2;
        src2 <= 6'h4;
        #1
        src0 <= 3'h2;
        src1 <= 2'h1;
        src2 <= 6'h33;
        #1
        src0 <= 3'h6;
        src1 <= 2'h1;
        src2 <= 6'h28;
        #1
        src0 <= 3'h4;
        src1 <= 2'h3;
        src2 <= 6'h3c;
        #1
        src0 <= 3'h3;
        src1 <= 2'h1;
        src2 <= 6'ha;
        #1
        src0 <= 3'h1;
        src1 <= 2'h2;
        src2 <= 6'h1a;
        #1
        src0 <= 3'h5;
        src1 <= 2'h1;
        src2 <= 6'h18;
    end
endmodule

