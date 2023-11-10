module tester();
    reg[6:0] src0;
    wire[2:0] dst;
    wire[2:0] srcsum;
    gpc7_3 gpc(
        src0, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src0[5]*1+src0[6]*1;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 7'h50;
        #1
        src0 <= 7'h39;
        #1
        src0 <= 7'h9;
        #1
        src0 <= 7'h4;
        #1
        src0 <= 7'h4c;
        #1
        src0 <= 7'h34;
        #1
        src0 <= 7'h53;
        #1
        src0 <= 7'h9;
        #1
        src0 <= 7'h4e;
        #1
        src0 <= 7'h28;
        #1
        src0 <= 7'h5d;
        #1
        src0 <= 7'h6a;
        #1
        src0 <= 7'h1f;
        #1
        src0 <= 7'h1c;
        #1
        src0 <= 7'h4c;
        #1
        src0 <= 7'h2f;
        #1
        src0 <= 7'h1d;
        #1
        src0 <= 7'h3a;
        #1
        src0 <= 7'h43;
        #1
        src0 <= 7'h10;
    end
endmodule

