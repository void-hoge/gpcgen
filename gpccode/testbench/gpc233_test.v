module tester();
    reg[2:0] src0;
    reg[1:0] src1;
    wire[2:0] dst;
    wire[2:0] srcsum;
    gpc23_3 gpc(
        src0, src1, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src1[0]*2+src1[1]*2;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 3'h5;
        src1 <= 2'h1;
        #1
        src0 <= 3'h5;
        src1 <= 2'h2;
        #1
        src0 <= 3'h5;
        src1 <= 2'h0;
        #1
        src0 <= 3'h4;
        src1 <= 2'h0;
        #1
        src0 <= 3'h6;
        src1 <= 2'h2;
        #1
        src0 <= 3'h4;
        src1 <= 2'h3;
        #1
        src0 <= 3'h6;
        src1 <= 2'h3;
        #1
        src0 <= 3'h3;
        src1 <= 2'h2;
        #1
        src0 <= 3'h7;
        src1 <= 2'h1;
        #1
        src0 <= 3'h4;
        src1 <= 2'h0;
        #1
        src0 <= 3'h7;
        src1 <= 2'h0;
        #1
        src0 <= 3'h5;
        src1 <= 2'h2;
        #1
        src0 <= 3'h1;
        src1 <= 2'h1;
        #1
        src0 <= 3'h4;
        src1 <= 2'h2;
        #1
        src0 <= 3'h5;
        src1 <= 2'h2;
        #1
        src0 <= 3'h2;
        src1 <= 2'h2;
        #1
        src0 <= 3'h3;
        src1 <= 2'h0;
        #1
        src0 <= 3'h6;
        src1 <= 2'h0;
        #1
        src0 <= 3'h5;
        src1 <= 2'h3;
        #1
        src0 <= 3'h2;
        src1 <= 2'h1;
    end
endmodule

