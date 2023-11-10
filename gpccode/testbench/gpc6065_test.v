module tester();
    reg[5:0] src0;
    reg[5:0] src2;
    wire[4:0] dst;
    wire[4:0] srcsum;
    gpc606_5 gpc(
        src0, src2, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src0[5]*1+src2[0]*4+src2[1]*4+src2[2]*4+src2[3]*4+src2[4]*4+src2[5]*4;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 6'h2f;
        src2 <= 6'h2b;
        #1
        src0 <= 6'h3c;
        src2 <= 6'h16;
        #1
        src0 <= 6'h3a;
        src2 <= 6'h12;
        #1
        src0 <= 6'hf;
        src2 <= 6'h1f;
        #1
        src0 <= 6'hc;
        src2 <= 6'h20;
        #1
        src0 <= 6'h4;
        src2 <= 6'h28;
        #1
        src0 <= 6'h1e;
        src2 <= 6'h2c;
        #1
        src0 <= 6'h2c;
        src2 <= 6'h1f;
        #1
        src0 <= 6'ha;
        src2 <= 6'h33;
        #1
        src0 <= 6'h7;
        src2 <= 6'h3e;
        #1
        src0 <= 6'h2b;
        src2 <= 6'h35;
        #1
        src0 <= 6'h32;
        src2 <= 6'h3b;
        #1
        src0 <= 6'h26;
        src2 <= 6'h29;
        #1
        src0 <= 6'h32;
        src2 <= 6'h31;
        #1
        src0 <= 6'h37;
        src2 <= 6'h36;
        #1
        src0 <= 6'h31;
        src2 <= 6'h3a;
        #1
        src0 <= 6'hb;
        src2 <= 6'h37;
        #1
        src0 <= 6'h3c;
        src2 <= 6'h2;
        #1
        src0 <= 6'h3a;
        src2 <= 6'h13;
        #1
        src0 <= 6'h0;
        src2 <= 6'h2c;
    end
endmodule

