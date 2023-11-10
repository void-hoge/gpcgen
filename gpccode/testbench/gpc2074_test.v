module tester();
    reg[6:0] src0;
    reg[1:0] src2;
    wire[3:0] dst;
    wire[3:0] srcsum;
    gpc207_4 gpc(
        src0, src2, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src0[5]*1+src0[6]*1+src2[0]*4+src2[1]*4;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 7'h3d;
        src2 <= 2'h2;
        #1
        src0 <= 7'h5f;
        src2 <= 2'h3;
        #1
        src0 <= 7'h38;
        src2 <= 2'h3;
        #1
        src0 <= 7'h24;
        src2 <= 2'h3;
        #1
        src0 <= 7'h70;
        src2 <= 2'h2;
        #1
        src0 <= 7'h0;
        src2 <= 2'h0;
        #1
        src0 <= 7'he;
        src2 <= 2'h3;
        #1
        src0 <= 7'h5f;
        src2 <= 2'h1;
        #1
        src0 <= 7'h2f;
        src2 <= 2'h1;
        #1
        src0 <= 7'h20;
        src2 <= 2'h2;
        #1
        src0 <= 7'h16;
        src2 <= 2'h2;
        #1
        src0 <= 7'h46;
        src2 <= 2'h2;
        #1
        src0 <= 7'h29;
        src2 <= 2'h2;
        #1
        src0 <= 7'h6;
        src2 <= 2'h0;
        #1
        src0 <= 7'h32;
        src2 <= 2'h0;
        #1
        src0 <= 7'h1d;
        src2 <= 2'h1;
        #1
        src0 <= 7'h28;
        src2 <= 2'h2;
        #1
        src0 <= 7'h3f;
        src2 <= 2'h2;
        #1
        src0 <= 7'h5f;
        src2 <= 2'h0;
        #1
        src0 <= 7'h36;
        src2 <= 2'h3;
    end
endmodule

