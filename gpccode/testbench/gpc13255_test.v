module tester();
    reg[4:0] src0;
    reg[1:0] src1;
    reg[2:0] src2;
    reg[0:0] src3;
    wire[4:0] dst;
    wire[4:0] srcsum;
    gpc1325_5 gpc(
        src0, src1, src2, src3, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src1[0]*2+src1[1]*2+src2[0]*4+src2[1]*4+src2[2]*4+src3[0]*8;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 5'h2;
        src1 <= 2'h2;
        src2 <= 3'h5;
        src3 <= 1'h1;
        #1
        src0 <= 5'h12;
        src1 <= 2'h2;
        src2 <= 3'h6;
        src3 <= 1'h1;
        #1
        src0 <= 5'h18;
        src1 <= 2'h3;
        src2 <= 3'h4;
        src3 <= 1'h0;
        #1
        src0 <= 5'h7;
        src1 <= 2'h2;
        src2 <= 3'h3;
        src3 <= 1'h1;
        #1
        src0 <= 5'h16;
        src1 <= 2'h0;
        src2 <= 3'h1;
        src3 <= 1'h1;
        #1
        src0 <= 5'h13;
        src1 <= 2'h2;
        src2 <= 3'h6;
        src3 <= 1'h0;
        #1
        src0 <= 5'hd;
        src1 <= 2'h1;
        src2 <= 3'h4;
        src3 <= 1'h1;
        #1
        src0 <= 5'hb;
        src1 <= 2'h1;
        src2 <= 3'h3;
        src3 <= 1'h0;
        #1
        src0 <= 5'he;
        src1 <= 2'h2;
        src2 <= 3'h1;
        src3 <= 1'h1;
        #1
        src0 <= 5'h15;
        src1 <= 2'h2;
        src2 <= 3'h4;
        src3 <= 1'h0;
        #1
        src0 <= 5'h11;
        src1 <= 2'h3;
        src2 <= 3'h4;
        src3 <= 1'h0;
        #1
        src0 <= 5'h17;
        src1 <= 2'h1;
        src2 <= 3'h7;
        src3 <= 1'h1;
        #1
        src0 <= 5'h14;
        src1 <= 2'h2;
        src2 <= 3'h2;
        src3 <= 1'h1;
        #1
        src0 <= 5'ha;
        src1 <= 2'h0;
        src2 <= 3'h2;
        src3 <= 1'h0;
        #1
        src0 <= 5'h15;
        src1 <= 2'h3;
        src2 <= 3'h0;
        src3 <= 1'h0;
        #1
        src0 <= 5'h8;
        src1 <= 2'h0;
        src2 <= 3'h3;
        src3 <= 1'h0;
        #1
        src0 <= 5'h14;
        src1 <= 2'h1;
        src2 <= 3'h3;
        src3 <= 1'h0;
        #1
        src0 <= 5'h16;
        src1 <= 2'h3;
        src2 <= 3'h1;
        src3 <= 1'h0;
        #1
        src0 <= 5'h3;
        src1 <= 2'h2;
        src2 <= 3'h5;
        src3 <= 1'h1;
        #1
        src0 <= 5'h1b;
        src1 <= 2'h1;
        src2 <= 3'h4;
        src3 <= 1'h0;
    end
endmodule

