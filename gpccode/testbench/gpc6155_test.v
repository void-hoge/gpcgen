module tester();
    reg[4:0] src0;
    reg[0:0] src1;
    reg[5:0] src2;
    wire[4:0] dst;
    wire[4:0] srcsum;
    gpc615_5 gpc(
        src0, src1, src2, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src1[0]*2+src2[0]*4+src2[1]*4+src2[2]*4+src2[3]*4+src2[4]*4+src2[5]*4;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 5'hf;
        src1 <= 1'h1;
        src2 <= 6'h18;
        #1
        src0 <= 5'h19;
        src1 <= 1'h0;
        src2 <= 6'h4;
        #1
        src0 <= 5'h12;
        src1 <= 1'h1;
        src2 <= 6'h8;
        #1
        src0 <= 5'h4;
        src1 <= 1'h0;
        src2 <= 6'h4;
        #1
        src0 <= 5'h1d;
        src1 <= 1'h0;
        src2 <= 6'h14;
        #1
        src0 <= 5'h13;
        src1 <= 1'h1;
        src2 <= 6'h20;
        #1
        src0 <= 5'h12;
        src1 <= 1'h0;
        src2 <= 6'h36;
        #1
        src0 <= 5'h1a;
        src1 <= 1'h1;
        src2 <= 6'h26;
        #1
        src0 <= 5'he;
        src1 <= 1'h1;
        src2 <= 6'h37;
        #1
        src0 <= 5'h1c;
        src1 <= 1'h0;
        src2 <= 6'h18;
        #1
        src0 <= 5'h9;
        src1 <= 1'h1;
        src2 <= 6'h9;
        #1
        src0 <= 5'h9;
        src1 <= 1'h1;
        src2 <= 6'h2;
        #1
        src0 <= 5'h7;
        src1 <= 1'h1;
        src2 <= 6'h14;
        #1
        src0 <= 5'h1;
        src1 <= 1'h1;
        src2 <= 6'h0;
        #1
        src0 <= 5'hb;
        src1 <= 1'h1;
        src2 <= 6'h2d;
        #1
        src0 <= 5'ha;
        src1 <= 1'h0;
        src2 <= 6'h12;
        #1
        src0 <= 5'h16;
        src1 <= 1'h0;
        src2 <= 6'h11;
        #1
        src0 <= 5'h1f;
        src1 <= 1'h1;
        src2 <= 6'hc;
        #1
        src0 <= 5'h1f;
        src1 <= 1'h1;
        src2 <= 6'h11;
        #1
        src0 <= 5'h18;
        src1 <= 1'h0;
        src2 <= 6'h24;
    end
endmodule

