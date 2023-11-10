module tester();
    reg[2:0] src0;
    wire[1:0] dst;
    wire[1:0] srcsum;
    gpc3_2 gpc(
        src0, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 3'h1;
        #1
        src0 <= 3'h7;
        #1
        src0 <= 3'h0;
        #1
        src0 <= 3'h2;
        #1
        src0 <= 3'h6;
        #1
        src0 <= 3'h0;
        #1
        src0 <= 3'h4;
        #1
        src0 <= 3'h6;
        #1
        src0 <= 3'h3;
        #1
        src0 <= 3'h6;
        #1
        src0 <= 3'h6;
        #1
        src0 <= 3'h4;
        #1
        src0 <= 3'h0;
        #1
        src0 <= 3'h5;
        #1
        src0 <= 3'h5;
        #1
        src0 <= 3'h3;
        #1
        src0 <= 3'h3;
        #1
        src0 <= 3'h1;
        #1
        src0 <= 3'h0;
        #1
        src0 <= 3'h5;
    end
endmodule

