module tester();
    reg[0:0] src0;
    wire[0:0] dst;
    wire[0:0] srcsum;
    gpc1_1 gpc(
        src0, dst
    );
    assign srcsum = src0[0]*1;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 1'h1;
        #1
        src0 <= 1'h0;
        #1
        src0 <= 1'h1;
        #1
        src0 <= 1'h1;
        #1
        src0 <= 1'h0;
        #1
        src0 <= 1'h0;
        #1
        src0 <= 1'h0;
        #1
        src0 <= 1'h0;
        #1
        src0 <= 1'h1;
        #1
        src0 <= 1'h1;
        #1
        src0 <= 1'h0;
        #1
        src0 <= 1'h1;
        #1
        src0 <= 1'h1;
        #1
        src0 <= 1'h0;
        #1
        src0 <= 1'h0;
        #1
        src0 <= 1'h1;
        #1
        src0 <= 1'h1;
        #1
        src0 <= 1'h0;
        #1
        src0 <= 1'h0;
        #1
        src0 <= 1'h1;
    end
endmodule

