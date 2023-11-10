module tester();
    reg[2:0] src0;
    reg[1:0] src1;
    reg[1:0] src2;
    wire[3:0] dst;
    wire[3:0] srcsum;
    gpc223_4 gpc(
        src0, src1, src2, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src1[0]*2+src1[1]*2+src2[0]*4+src2[1]*4;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 3'h7;
        src1 <= 2'h1;
        src2 <= 2'h0;
        #1
        src0 <= 3'h3;
        src1 <= 2'h3;
        src2 <= 2'h2;
        #1
        src0 <= 3'h1;
        src1 <= 2'h1;
        src2 <= 2'h1;
        #1
        src0 <= 3'h7;
        src1 <= 2'h1;
        src2 <= 2'h2;
        #1
        src0 <= 3'h7;
        src1 <= 2'h0;
        src2 <= 2'h3;
        #1
        src0 <= 3'h5;
        src1 <= 2'h3;
        src2 <= 2'h1;
        #1
        src0 <= 3'h4;
        src1 <= 2'h1;
        src2 <= 2'h2;
        #1
        src0 <= 3'h5;
        src1 <= 2'h2;
        src2 <= 2'h3;
        #1
        src0 <= 3'h6;
        src1 <= 2'h3;
        src2 <= 2'h2;
        #1
        src0 <= 3'h0;
        src1 <= 2'h0;
        src2 <= 2'h2;
        #1
        src0 <= 3'h4;
        src1 <= 2'h1;
        src2 <= 2'h0;
        #1
        src0 <= 3'h4;
        src1 <= 2'h2;
        src2 <= 2'h0;
        #1
        src0 <= 3'h0;
        src1 <= 2'h3;
        src2 <= 2'h1;
        #1
        src0 <= 3'h4;
        src1 <= 2'h1;
        src2 <= 2'h3;
        #1
        src0 <= 3'h4;
        src1 <= 2'h1;
        src2 <= 2'h2;
        #1
        src0 <= 3'h3;
        src1 <= 2'h2;
        src2 <= 2'h3;
        #1
        src0 <= 3'h1;
        src1 <= 2'h0;
        src2 <= 2'h2;
        #1
        src0 <= 3'h2;
        src1 <= 2'h2;
        src2 <= 2'h2;
        #1
        src0 <= 3'h0;
        src1 <= 2'h3;
        src2 <= 2'h1;
        #1
        src0 <= 3'h7;
        src1 <= 2'h1;
        src2 <= 2'h3;
    end
endmodule

