module tester();
    reg[4:0] src0;
    reg[2:0] src1;
    reg[0:0] src2;
    reg[1:0] src3;
    wire[4:0] dst;
    wire[4:0] srcsum;
    gpc2135_5 gpc(
        src0, src1, src2, src3, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src1[0]*2+src1[1]*2+src1[2]*2+src2[0]*4+src3[0]*8+src3[1]*8;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 5'h10;
        src1 <= 3'h2;
        src2 <= 1'h1;
        src3 <= 2'h3;
        #1
        src0 <= 5'hb;
        src1 <= 3'h4;
        src2 <= 1'h1;
        src3 <= 2'h1;
        #1
        src0 <= 5'h3;
        src1 <= 3'h4;
        src2 <= 1'h0;
        src3 <= 2'h0;
        #1
        src0 <= 5'h7;
        src1 <= 3'h2;
        src2 <= 1'h1;
        src3 <= 2'h3;
        #1
        src0 <= 5'ha;
        src1 <= 3'h3;
        src2 <= 1'h0;
        src3 <= 2'h2;
        #1
        src0 <= 5'h7;
        src1 <= 3'h7;
        src2 <= 1'h1;
        src3 <= 2'h1;
        #1
        src0 <= 5'h9;
        src1 <= 3'h2;
        src2 <= 1'h0;
        src3 <= 2'h0;
        #1
        src0 <= 5'h3;
        src1 <= 3'h4;
        src2 <= 1'h1;
        src3 <= 2'h2;
        #1
        src0 <= 5'hf;
        src1 <= 3'h5;
        src2 <= 1'h1;
        src3 <= 2'h0;
        #1
        src0 <= 5'h0;
        src1 <= 3'h3;
        src2 <= 1'h0;
        src3 <= 2'h1;
        #1
        src0 <= 5'h0;
        src1 <= 3'h6;
        src2 <= 1'h1;
        src3 <= 2'h3;
        #1
        src0 <= 5'h1b;
        src1 <= 3'h0;
        src2 <= 1'h0;
        src3 <= 2'h0;
        #1
        src0 <= 5'hb;
        src1 <= 3'h0;
        src2 <= 1'h1;
        src3 <= 2'h3;
        #1
        src0 <= 5'h18;
        src1 <= 3'h2;
        src2 <= 1'h0;
        src3 <= 2'h3;
        #1
        src0 <= 5'h11;
        src1 <= 3'h5;
        src2 <= 1'h1;
        src3 <= 2'h0;
        #1
        src0 <= 5'h17;
        src1 <= 3'h1;
        src2 <= 1'h1;
        src3 <= 2'h0;
        #1
        src0 <= 5'h18;
        src1 <= 3'h0;
        src2 <= 1'h1;
        src3 <= 2'h0;
        #1
        src0 <= 5'h1b;
        src1 <= 3'h7;
        src2 <= 1'h1;
        src3 <= 2'h0;
        #1
        src0 <= 5'h1d;
        src1 <= 3'h7;
        src2 <= 1'h1;
        src3 <= 2'h0;
        #1
        src0 <= 5'hc;
        src1 <= 3'h0;
        src2 <= 1'h1;
        src3 <= 2'h3;
    end
endmodule

