# GPCGEN
- GPCGEN (Generalized Parallel Counter Generator)は、Xilinx社のFPGA上のコンプレッサツリーで用いる一般化並列カウンタ(GPC)のVerilog HDLによる実装を自動生成するプロジェクトです。

## SEE ALSO
- CMPGEN: https://github.com/void-hoge/cmpgen
  - GPCGENで出力されるモジュールを利用したコンプレッサツリー合成系の実装

## 一般化並列カウンタ
- 一般化並列カウンタ(Generalized Parallel Counter; GPC)は、小規模な重み付き多入力加算器です。
- ASICでは全加算器を用いた回路が知られていますが、FPGAで実装する上でLUTなどの入力数を有効に活用するために、より多くのビット数、複数の桁の値を加算できるように拡張したものがGPCです。
- 例
  - 全加算器は1の位に3ビット入力し、出力が2ビットなのでGPC (3;2)と表されます。
  - 4の位に6ビット、2の位に1ビット、1の位に5ビット入力するGPCは、GPC (6,1,5;5)と表されます。

## 実行
### gpcgen.py
- `gpcgen.py`は、GPCのソースファイルに記述されたGPCが動作するかをシミュレーションによって検証します。
```
$ ./gpcgen.py gpcsrc/gpc14155.py
...
PASS
$
```

### gpccodegen.py
- `gpccodegen.py`は、GPCのソースファイルに記述されたGPCのVerilog HDLモジュールを自動生成します。
```
$ ./gpccodegen.py gpcsrc/gpc14155.py
module gpc1415_5(input wire[4:0]src0, input wire[0:0]src1, input wire[3:0]src2, input wire[0:0]src3, output wire[4:0]dst);
    wire[1:0] lut0_out;
    wire[1:0] lut1_out;
    wire[1:0] lut2_out;
    wire[1:0] lut3_out;
    wire[3:0] genes;
    wire[3:0] props;
    wire[3:0] carry4_out;
    wire[3:0] carry4_carryout;
    LUT5 #(
        .INIT(32'h69966996)
    ) lut0_0_inst (
        .I0(src0[0]),
        .I1(src0[1]),
        .I2(src0[2]),
        .I3(src0[3]),
        .O(lut0_out[0])
    );
    LUT5 #(
        .INIT(32'hff00ff00)
    ) lut0_1_inst (
        .I0(src0[0]),
        .I1(src0[1]),
        .I2(src0[2]),
        .I3(src0[3]),
        .O(lut0_out[1])
    );
    LUT5 #(
        .INIT(32'h17e817e8)
    ) lut1_0_inst (
        .I0(src0[0]),
        .I1(src0[1]),
        .I2(src0[2]),
        .I3(src1[0]),
        .O(lut1_out[0])
    );
    LUT5 #(
        .INIT(32'hff00ff00)
    ) lut1_1_inst (
        .I0(src0[0]),
        .I1(src0[1]),
        .I2(src0[2]),
        .I3(src1[0]),
        .O(lut1_out[1])
    );
    LUT5 #(
        .INIT(32'h69966996)
    ) lut2_0_inst (
        .I0(src2[0]),
        .I1(src2[1]),
        .I2(src2[2]),
        .I3(src2[3]),
        .O(lut2_out[0])
    );
    LUT5 #(
        .INIT(32'hff00ff00)
    ) lut2_1_inst (
        .I0(src2[0]),
        .I1(src2[1]),
        .I2(src2[2]),
        .I3(src2[3]),
        .O(lut2_out[1])
    );
    LUT5 #(
        .INIT(32'h17e817e8)
    ) lut3_0_inst (
        .I0(src2[0]),
        .I1(src2[1]),
        .I2(src2[2]),
        .I3(src3[0]),
        .O(lut3_out[0])
    );
    LUT5 #(
        .INIT(32'hff00ff00)
    ) lut3_1_inst (
        .I0(src2[0]),
        .I1(src2[1]),
        .I2(src2[2]),
        .I3(src3[0]),
        .O(lut3_out[1])
    );
    assign props[0] = lut0_out[0];
    assign props[1] = lut1_out[0];
    assign props[2] = lut2_out[0];
    assign props[3] = lut3_out[0];
    assign genes[0] = lut0_out[1];
    assign genes[1] = lut1_out[1];
    assign genes[2] = lut2_out[1];
    assign genes[3] = lut3_out[1];
    CARRY4 CARRY4_inst (
        .CO(carry4_carryout),
        .O(carry4_out),
        .CI(0),
        .CYINIT(src0[4]),
        .DI(genes),
        .S(props)
    );
    assign dst[0] = carry4_out[0];
    assign dst[1] = carry4_out[1];
    assign dst[2] = carry4_out[2];
    assign dst[3] = carry4_out[3];
    assign dst[4] = carry4_carryout[3];
endmodule
$
```

### gpctestgen.py
- gpctestgen.pyは、gpccodegen.pyで生成されたVerilog HDLモジュールをテストするモジュールを自動生成します。
```
$ ./gpctestgen.py gpcsrc/gpc14155.py
module tester();
    reg[4:0] src0;
    reg[0:0] src1;
    reg[3:0] src2;
    reg[0:0] src3;
    wire[4:0] dst;
    wire[4:0] srcsum;
    gpc1415_5 gpc(
        src0, src1, src2, src3, dst
    );
    assign srcsum = src0[0]*1+src0[1]*1+src0[2]*1+src0[3]*1+src0[4]*1+src1[0]*2+src2[0]*4+src2[1]*4+src2[2]*4+src2[3]*4+src3[0]*8;
    initial begin
        $monitor("%x => %x", srcsum, dst);
    end
    initial begin
        #1
        src0 <= 5'h14;
        src1 <= 1'h1;
        src2 <= 4'h3;
        src3 <= 1'h1;
        #1
        src0 <= 5'h2;
        src1 <= 1'h0;
        src2 <= 4'h0;
        src3 <= 1'h0;
        #1
        src0 <= 5'hd;
        src1 <= 1'h1;
        src2 <= 4'hb;
        src3 <= 1'h0;
        #1
        src0 <= 5'h3;
        src1 <= 1'h0;
        src2 <= 4'h2;
        src3 <= 1'h1;
        #1
        src0 <= 5'hb;
        src1 <= 1'h1;
        src2 <= 4'hb;
        src3 <= 1'h0;
        #1
        src0 <= 5'h18;
        src1 <= 1'h1;
        src2 <= 4'hd;
        src3 <= 1'h0;
        #1
        src0 <= 5'he;
        src1 <= 1'h0;
        src2 <= 4'h1;
        src3 <= 1'h1;
        #1
        src0 <= 5'h1f;
        src1 <= 1'h1;
        src2 <= 4'hb;
        src3 <= 1'h0;
        #1
        src0 <= 5'h4;
        src1 <= 1'h1;
        src2 <= 4'h9;
        src3 <= 1'h1;
        #1
        src0 <= 5'h1e;
        src1 <= 1'h0;
        src2 <= 4'h3;
        src3 <= 1'h1;
        #1
        src0 <= 5'h17;
        src1 <= 1'h1;
        src2 <= 4'h3;
        src3 <= 1'h1;
        #1
        src0 <= 5'h17;
        src1 <= 1'h1;
        src2 <= 4'h8;
        src3 <= 1'h0;
        #1
        src0 <= 5'h2;
        src1 <= 1'h1;
        src2 <= 4'h3;
        src3 <= 1'h1;
        #1
        src0 <= 5'h5;
        src1 <= 1'h0;
        src2 <= 4'h5;
        src3 <= 1'h1;
        #1
        src0 <= 5'h9;
        src1 <= 1'h0;
        src2 <= 4'h7;
        src3 <= 1'h1;
        #1
        src0 <= 5'h10;
        src1 <= 1'h0;
        src2 <= 4'hc;
        src3 <= 1'h1;
        #1
        src0 <= 5'he;
        src1 <= 1'h1;
        src2 <= 4'h3;
        src3 <= 1'h1;
        #1
        src0 <= 5'h1a;
        src1 <= 1'h1;
        src2 <= 4'h9;
        src3 <= 1'h0;
        #1
        src0 <= 5'h16;
        src1 <= 1'h1;
        src2 <= 4'h4;
        src3 <= 1'h0;
        #1
        src0 <= 5'h17;
        src1 <= 1'h0;
        src2 <= 4'ha;
        src3 <= 1'h0;
    end
endmodule
```

## GPC sourceの構造
- GPC sourceはPythonのリテラルで記述して、exec()で読むことでパースしています。

```python3
self.gpcin = [5,1,4,1] # GPCの入力ビット
self.lut = { # LUTの定数
    0:0xff00ff0069966996,
    1:0xff00ff0017e817e8,
    2:0xff00ff0069966996,
    3:0xff00ff0017e817e8
}
self.lutin = { # LUTの入力リスト
    0:[
        {'typ':'gpc', 'place':0, 'idx':0}, # GPCの入力の、下から0桁目の、0番目
        {'typ':'gpc', 'place':0, 'idx':1},
        {'typ':'gpc', 'place':0, 'idx':2},
        {'typ':'gpc', 'place':0, 'idx':3},
    ],
    1:[
        {'typ':'gpc', 'place':0, 'idx':0},
        {'typ':'gpc', 'place':0, 'idx':1},
        {'typ':'gpc', 'place':0, 'idx':2},
        {'typ':'gpc', 'place':1, 'idx':0}, # GPCの入力の、下から1桁目の、0番目
    ],
    2:[
        {'typ':'gpc', 'place':2, 'idx':0},
        {'typ':'gpc', 'place':2, 'idx':1},
        {'typ':'gpc', 'place':2, 'idx':2},
        {'typ':'gpc', 'place':2, 'idx':3},
    ],
    3:[
        {'typ':'gpc', 'place':2, 'idx':0},
        {'typ':'gpc', 'place':2, 'idx':1},
        {'typ':'gpc', 'place':2, 'idx':2},
        {'typ':'gpc', 'place':3, 'idx':0},
    ],
}
self.carry4in = { # CARRY4の入力
    'props':{ # propagateの入力
        0:{'typ':'lut', 'idx':0, 'out':0}, # 0番目のLUTの0番目の出力
        1:{'typ':'lut', 'idx':1, 'out':0}, # 1番目のLUTの0番目の出力
        2:{'typ':'lut', 'idx':2, 'out':0},
        3:{'typ':'lut', 'idx':3, 'out':0},
    },
    'genes':{ # generateの入力
        0:{'typ':'lut', 'idx':0, 'out':1}, # 0番目のLUTの1番目の出力
        1:{'typ':'lut', 'idx':1, 'out':1},
        2:{'typ':'lut', 'idx':2, 'out':1},
        3:{'typ':'lut', 'idx':3, 'out':1},
    },
    'carry':{'typ':'gpc', 'place':0, 'idx':4} # carry入力
}
self.gpcout = { # GPCの出力
    0:{'typ':'carry4', 'idx':0}, # 0桁目は、carry4の、0番目
    1:{'typ':'carry4', 'idx':1},
    2:{'typ':'carry4', 'idx':2},
    3:{'typ':'carry4', 'idx':3},
    4:{'typ':'carryout', 'idx':3}, # 4桁目は、carryoutの3番目
}
```

## AUTHOR
- Mugi Noda(void-hoge)

## LICENSE
- GPLv3
