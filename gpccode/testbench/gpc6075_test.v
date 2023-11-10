module tester();
    reg[6:0] src0;
    reg[5:0] src2;
    wire[4:0] dst;
    wire[4:0] srcsum;
    gpc607_5 gpc(
        src0, src2, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src0[5]*1+src0[6]*1+src2[0]*4+src2[1]*4+src2[2]*4+src2[3]*4+src2[4]*4+src2[5]*4;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 7'h30;
        src2 <= 6'h2b;
        #1
        src0 <= 7'h10;
        src2 <= 6'h1a;
        #1
        src0 <= 7'h62;
        src2 <= 6'he;
        #1
        src0 <= 7'h6f;
        src2 <= 6'he;
        #1
        src0 <= 7'h4d;
        src2 <= 6'h2a;
        #1
        src0 <= 7'h34;
        src2 <= 6'h39;
        #1
        src0 <= 7'h26;
        src2 <= 6'h1;
        #1
        src0 <= 7'h5e;
        src2 <= 6'h2f;
        #1
        src0 <= 7'h2f;
        src2 <= 6'h32;
        #1
        src0 <= 7'h48;
        src2 <= 6'h2e;
        #1
        src0 <= 7'h6d;
        src2 <= 6'h39;
        #1
        src0 <= 7'h38;
        src2 <= 6'h13;
        #1
        src0 <= 7'h5a;
        src2 <= 6'h34;
        #1
        src0 <= 7'h69;
        src2 <= 6'hc;
        #1
        src0 <= 7'h19;
        src2 <= 6'h39;
        #1
        src0 <= 7'h6c;
        src2 <= 6'h19;
        #1
        src0 <= 7'h2d;
        src2 <= 6'h26;
        #1
        src0 <= 7'h7d;
        src2 <= 6'h30;
        #1
        src0 <= 7'h3d;
        src2 <= 6'h33;
        #1
        src0 <= 7'h1b;
        src2 <= 6'h0;
    end
endmodule

