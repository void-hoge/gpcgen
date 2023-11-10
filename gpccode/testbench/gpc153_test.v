module tester();
    reg[4:0] src0;
    reg[0:0] src1;
    wire[2:0] dst;
    wire[2:0] srcsum;
    gpc15_3 gpc(
        src0, src1, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src1[0]*2;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 5'h10;
        src1 <= 1'h0;
        #1
        src0 <= 5'ha;
        src1 <= 1'h0;
        #1
        src0 <= 5'h1d;
        src1 <= 1'h0;
        #1
        src0 <= 5'h8;
        src1 <= 1'h1;
        #1
        src0 <= 5'h1c;
        src1 <= 1'h1;
        #1
        src0 <= 5'h1a;
        src1 <= 1'h0;
        #1
        src0 <= 5'h1a;
        src1 <= 1'h1;
        #1
        src0 <= 5'h1;
        src1 <= 1'h1;
        #1
        src0 <= 5'h1;
        src1 <= 1'h1;
        #1
        src0 <= 5'h8;
        src1 <= 1'h0;
        #1
        src0 <= 5'hf;
        src1 <= 1'h0;
        #1
        src0 <= 5'h2;
        src1 <= 1'h1;
        #1
        src0 <= 5'hd;
        src1 <= 1'h0;
        #1
        src0 <= 5'h10;
        src1 <= 1'h1;
        #1
        src0 <= 5'h19;
        src1 <= 1'h1;
        #1
        src0 <= 5'h8;
        src1 <= 1'h1;
        #1
        src0 <= 5'h14;
        src1 <= 1'h1;
        #1
        src0 <= 5'hb;
        src1 <= 1'h1;
        #1
        src0 <= 5'h3;
        src1 <= 1'h0;
        #1
        src0 <= 5'h1a;
        src1 <= 1'h0;
    end
endmodule

