module tester();
    reg[5:0] src0;
    reg[1:0] src2;
    wire[3:0] dst;
    wire[3:0] srcsum;
    gpc206_4 gpc(
        src0, src2, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src0[5]*1+src2[0]*4+src2[1]*4;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 6'h3;
        src2 <= 2'h3;
        #1
        src0 <= 6'h0;
        src2 <= 2'h2;
        #1
        src0 <= 6'he;
        src2 <= 2'h3;
        #1
        src0 <= 6'h33;
        src2 <= 2'h0;
        #1
        src0 <= 6'h1e;
        src2 <= 2'h1;
        #1
        src0 <= 6'h32;
        src2 <= 2'h0;
        #1
        src0 <= 6'h5;
        src2 <= 2'h0;
        #1
        src0 <= 6'h25;
        src2 <= 2'h1;
        #1
        src0 <= 6'he;
        src2 <= 2'h3;
        #1
        src0 <= 6'h24;
        src2 <= 2'h3;
        #1
        src0 <= 6'h1d;
        src2 <= 2'h2;
        #1
        src0 <= 6'hf;
        src2 <= 2'h3;
        #1
        src0 <= 6'h31;
        src2 <= 2'h1;
        #1
        src0 <= 6'h1c;
        src2 <= 2'h1;
        #1
        src0 <= 6'h2;
        src2 <= 2'h0;
        #1
        src0 <= 6'h3f;
        src2 <= 2'h3;
        #1
        src0 <= 6'h3d;
        src2 <= 2'h0;
        #1
        src0 <= 6'he;
        src2 <= 2'h2;
        #1
        src0 <= 6'h22;
        src2 <= 2'h0;
        #1
        src0 <= 6'hf;
        src2 <= 2'h2;
    end
endmodule

