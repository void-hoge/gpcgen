module tester();
    reg[5:0] src0;
    wire[2:0] dst;
    wire[2:0] srcsum;
    gpc6_3 gpc(
        src0, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src0[5]*1;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 6'h12;
        #1
        src0 <= 6'h31;
        #1
        src0 <= 6'h20;
        #1
        src0 <= 6'h2e;
        #1
        src0 <= 6'h1a;
        #1
        src0 <= 6'h3f;
        #1
        src0 <= 6'h20;
        #1
        src0 <= 6'he;
        #1
        src0 <= 6'h15;
        #1
        src0 <= 6'h25;
        #1
        src0 <= 6'h39;
        #1
        src0 <= 6'h26;
        #1
        src0 <= 6'h38;
        #1
        src0 <= 6'h1e;
        #1
        src0 <= 6'h23;
        #1
        src0 <= 6'h29;
        #1
        src0 <= 6'h2d;
        #1
        src0 <= 6'h13;
        #1
        src0 <= 6'h15;
        #1
        src0 <= 6'h3d;
    end
endmodule

