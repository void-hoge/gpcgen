module tester();
    reg[4:0] src0;
    reg[0:0] src1;
    reg[1:0] src2;
    wire[3:0] dst;
    wire[3:0] srcsum;
    gpc215_4 gpc(
        src0, src1, src2, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src1[0]*2+src2[0]*4+src2[1]*4;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 5'h14;
        src1 <= 1'h1;
        src2 <= 2'h1;
        #1
        src0 <= 5'hd;
        src1 <= 1'h0;
        src2 <= 2'h3;
        #1
        src0 <= 5'h4;
        src1 <= 1'h1;
        src2 <= 2'h0;
        #1
        src0 <= 5'hb;
        src1 <= 1'h0;
        src2 <= 2'h0;
        #1
        src0 <= 5'h19;
        src1 <= 1'h0;
        src2 <= 2'h3;
        #1
        src0 <= 5'h0;
        src1 <= 1'h1;
        src2 <= 2'h3;
        #1
        src0 <= 5'h1a;
        src1 <= 1'h1;
        src2 <= 2'h1;
        #1
        src0 <= 5'h1e;
        src1 <= 1'h0;
        src2 <= 2'h3;
        #1
        src0 <= 5'h19;
        src1 <= 1'h0;
        src2 <= 2'h3;
        #1
        src0 <= 5'h19;
        src1 <= 1'h0;
        src2 <= 2'h1;
        #1
        src0 <= 5'h13;
        src1 <= 1'h1;
        src2 <= 2'h2;
        #1
        src0 <= 5'h16;
        src1 <= 1'h0;
        src2 <= 2'h3;
        #1
        src0 <= 5'h6;
        src1 <= 1'h1;
        src2 <= 2'h2;
        #1
        src0 <= 5'h13;
        src1 <= 1'h0;
        src2 <= 2'h0;
        #1
        src0 <= 5'h3;
        src1 <= 1'h1;
        src2 <= 2'h0;
        #1
        src0 <= 5'hb;
        src1 <= 1'h1;
        src2 <= 2'h1;
        #1
        src0 <= 5'h16;
        src1 <= 1'h1;
        src2 <= 2'h0;
        #1
        src0 <= 5'h0;
        src1 <= 1'h1;
        src2 <= 2'h0;
        #1
        src0 <= 5'h1;
        src1 <= 1'h1;
        src2 <= 2'h1;
        #1
        src0 <= 5'hc;
        src1 <= 1'h1;
        src2 <= 2'h2;
    end
endmodule

