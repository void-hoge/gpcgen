module tester();
    reg[5:0] src0;
    reg[3:0] src2;
    reg[0:0] src3;
    wire[4:0] dst;
    wire[4:0] srcsum;
    gpc1406_5 gpc(
        src0, src2, src3, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src0[5]*1+src2[0]*4+src2[1]*4+src2[2]*4+src2[3]*4+src3[0]*8;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 6'h2d;
        src2 <= 4'ha;
        src3 <= 1'h0;
        #1
        src0 <= 6'h20;
        src2 <= 4'h5;
        src3 <= 1'h1;
        #1
        src0 <= 6'h3;
        src2 <= 4'hf;
        src3 <= 1'h0;
        #1
        src0 <= 6'h5;
        src2 <= 4'h3;
        src3 <= 1'h1;
        #1
        src0 <= 6'h26;
        src2 <= 4'hd;
        src3 <= 1'h1;
        #1
        src0 <= 6'h3e;
        src2 <= 4'h9;
        src3 <= 1'h1;
        #1
        src0 <= 6'he;
        src2 <= 4'h5;
        src3 <= 1'h1;
        #1
        src0 <= 6'h28;
        src2 <= 4'he;
        src3 <= 1'h1;
        #1
        src0 <= 6'h25;
        src2 <= 4'h7;
        src3 <= 1'h1;
        #1
        src0 <= 6'h1;
        src2 <= 4'h6;
        src3 <= 1'h0;
        #1
        src0 <= 6'h4;
        src2 <= 4'h9;
        src3 <= 1'h1;
        #1
        src0 <= 6'h30;
        src2 <= 4'he;
        src3 <= 1'h1;
        #1
        src0 <= 6'h27;
        src2 <= 4'h5;
        src3 <= 1'h0;
        #1
        src0 <= 6'h33;
        src2 <= 4'h6;
        src3 <= 1'h1;
        #1
        src0 <= 6'h2f;
        src2 <= 4'h5;
        src3 <= 1'h0;
        #1
        src0 <= 6'h27;
        src2 <= 4'hf;
        src3 <= 1'h0;
        #1
        src0 <= 6'h10;
        src2 <= 4'h2;
        src3 <= 1'h1;
        #1
        src0 <= 6'h2;
        src2 <= 4'h5;
        src3 <= 1'h0;
        #1
        src0 <= 6'h20;
        src2 <= 4'hf;
        src3 <= 1'h0;
        #1
        src0 <= 6'h29;
        src2 <= 4'h6;
        src3 <= 1'h0;
    end
endmodule

