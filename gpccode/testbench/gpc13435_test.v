module tester();
    reg[2:0] src0;
    reg[3:0] src1;
    reg[2:0] src2;
    reg[0:0] src3;
    wire[4:0] dst;
    wire[4:0] srcsum;
    gpc1343_5 gpc(
        src0, src1, src2, src3, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src1[0]*2+src1[1]*2+src1[2]*2+src1[3]*2+src2[0]*4+src2[1]*4+src2[2]*4+src3[0]*8;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 3'h2;
        src1 <= 4'ha;
        src2 <= 3'h3;
        src3 <= 1'h0;
        #1
        src0 <= 3'h0;
        src1 <= 4'hd;
        src2 <= 3'h1;
        src3 <= 1'h1;
        #1
        src0 <= 3'h0;
        src1 <= 4'h4;
        src2 <= 3'h0;
        src3 <= 1'h1;
        #1
        src0 <= 3'h2;
        src1 <= 4'h9;
        src2 <= 3'h3;
        src3 <= 1'h0;
        #1
        src0 <= 3'h2;
        src1 <= 4'h8;
        src2 <= 3'h0;
        src3 <= 1'h1;
        #1
        src0 <= 3'h3;
        src1 <= 4'h5;
        src2 <= 3'h0;
        src3 <= 1'h1;
        #1
        src0 <= 3'h2;
        src1 <= 4'ha;
        src2 <= 3'h1;
        src3 <= 1'h0;
        #1
        src0 <= 3'h1;
        src1 <= 4'h9;
        src2 <= 3'h2;
        src3 <= 1'h1;
        #1
        src0 <= 3'h6;
        src1 <= 4'h3;
        src2 <= 3'h4;
        src3 <= 1'h1;
        #1
        src0 <= 3'h4;
        src1 <= 4'ha;
        src2 <= 3'h5;
        src3 <= 1'h0;
        #1
        src0 <= 3'h3;
        src1 <= 4'h3;
        src2 <= 3'h2;
        src3 <= 1'h1;
        #1
        src0 <= 3'h7;
        src1 <= 4'h1;
        src2 <= 3'h3;
        src3 <= 1'h1;
        #1
        src0 <= 3'h0;
        src1 <= 4'he;
        src2 <= 3'h6;
        src3 <= 1'h1;
        #1
        src0 <= 3'h4;
        src1 <= 4'h6;
        src2 <= 3'h1;
        src3 <= 1'h0;
        #1
        src0 <= 3'h7;
        src1 <= 4'h2;
        src2 <= 3'h1;
        src3 <= 1'h1;
        #1
        src0 <= 3'h0;
        src1 <= 4'h8;
        src2 <= 3'h3;
        src3 <= 1'h1;
        #1
        src0 <= 3'h1;
        src1 <= 4'h0;
        src2 <= 3'h2;
        src3 <= 1'h0;
        #1
        src0 <= 3'h4;
        src1 <= 4'he;
        src2 <= 3'h3;
        src3 <= 1'h0;
        #1
        src0 <= 3'h5;
        src1 <= 4'h7;
        src2 <= 3'h5;
        src3 <= 1'h1;
        #1
        src0 <= 3'h1;
        src1 <= 4'h8;
        src2 <= 3'h3;
        src3 <= 1'h1;
    end
endmodule

