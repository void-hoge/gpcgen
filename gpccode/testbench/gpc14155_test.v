module tester();
    reg[4:0] src0;
    reg[0:0] src1;
    reg[3:0] src2;
    reg[0:0] src3;
    wire[4:0] dst;
    wire[4:0] srcsum;
    gpc1415_5 gpc(
        src0, src1, src2, src3, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src1[0]*2+src2[0]*4+src2[1]*4+src2[2]*4+src2[3]*4+src3[0]*8;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 5'h8;
        src1 <= 1'h1;
        src2 <= 4'he;
        src3 <= 1'h0;
        #1
        src0 <= 5'h14;
        src1 <= 1'h0;
        src2 <= 4'h4;
        src3 <= 1'h1;
        #1
        src0 <= 5'hc;
        src1 <= 1'h1;
        src2 <= 4'h5;
        src3 <= 1'h1;
        #1
        src0 <= 5'h19;
        src1 <= 1'h0;
        src2 <= 4'h2;
        src3 <= 1'h1;
        #1
        src0 <= 5'h16;
        src1 <= 1'h0;
        src2 <= 4'h4;
        src3 <= 1'h0;
        #1
        src0 <= 5'hc;
        src1 <= 1'h1;
        src2 <= 4'hc;
        src3 <= 1'h1;
        #1
        src0 <= 5'h19;
        src1 <= 1'h0;
        src2 <= 4'hd;
        src3 <= 1'h1;
        #1
        src0 <= 5'h5;
        src1 <= 1'h1;
        src2 <= 4'h7;
        src3 <= 1'h0;
        #1
        src0 <= 5'hc;
        src1 <= 1'h0;
        src2 <= 4'h4;
        src3 <= 1'h0;
        #1
        src0 <= 5'hb;
        src1 <= 1'h0;
        src2 <= 4'h5;
        src3 <= 1'h0;
        #1
        src0 <= 5'h4;
        src1 <= 1'h1;
        src2 <= 4'h3;
        src3 <= 1'h1;
        #1
        src0 <= 5'h18;
        src1 <= 1'h0;
        src2 <= 4'h8;
        src3 <= 1'h1;
        #1
        src0 <= 5'he;
        src1 <= 1'h1;
        src2 <= 4'hc;
        src3 <= 1'h1;
        #1
        src0 <= 5'h2;
        src1 <= 1'h0;
        src2 <= 4'hc;
        src3 <= 1'h1;
        #1
        src0 <= 5'h2;
        src1 <= 1'h0;
        src2 <= 4'h0;
        src3 <= 1'h0;
        #1
        src0 <= 5'h2;
        src1 <= 1'h1;
        src2 <= 4'h0;
        src3 <= 1'h1;
        #1
        src0 <= 5'h14;
        src1 <= 1'h1;
        src2 <= 4'ha;
        src3 <= 1'h0;
        #1
        src0 <= 5'h1d;
        src1 <= 1'h0;
        src2 <= 4'h5;
        src3 <= 1'h0;
        #1
        src0 <= 5'h0;
        src1 <= 1'h0;
        src2 <= 4'h8;
        src3 <= 1'h0;
        #1
        src0 <= 5'h13;
        src1 <= 1'h0;
        src2 <= 4'hf;
        src3 <= 1'h0;
    end
endmodule

