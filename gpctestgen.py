#!/usr/bin/env python3

import sys
import random
from gpcgen import gpcgen

class gpctestgen(gpcgen):
    def __init__(self, src):
        super().__init__(src)
        self.tab = '    '

    def gen_module(self, tablevel=0):
        code = ''
        code += f'{self.tab*tablevel}module tester();\n'
        code += self.gen_wire_reg_declarations(tablevel+1)
        code += self.gen_gpc_instantation(tablevel+1)
        code += self.gen_srcsum_assignment(tablevel+1)
        code += self.gen_monitor(tablevel+1)
        code += self.gen_test(tablevel+1)
        code += f'{self.tab*tablevel}endmodule\n'
        return code

    def gen_wire_reg_declarations(self, tablevel):
        code = ''
        for i, num in enumerate(self.gpcin):
            if num != 0:
                code += f'{self.tab*tablevel}reg[{num-1}:0] src{i};\n'
        code += f'{self.tab*tablevel}wire[{len(self.gpcout)-1}:0] dst;\n'
        code += f'{self.tab*tablevel}wire[{len(self.gpcout)-1}:0] srcsum;\n'
        return code

    def gen_gpc_instantation(self, tablevel):
        code = ''
        code += f'{self.tab*tablevel}{self.gpcname} gpc(\n'
        args = []
        for i, num in enumerate(self.gpcin):
            if num != 0:
                args.append(f'src{i}')
        args.append(f'dst')
        code += f'{self.tab*(tablevel+1)}'
        code += ', '.join(args) +'\n'
        code += f'{self.tab*tablevel});\n'
        return code

    def gen_srcsum_assignment(self, tablevel):
        code = ''
        code += f'{self.tab*tablevel}assign srcsum = '
        terms = []
        for i, num in enumerate(self.gpcin):
            if num != 0:
                for j in range(num):
                    terms.append(f'src{i}[{j}]*{1<<i}')
        code += '+'.join(terms)+';\n'
        return code

    def gen_monitor(self, tablevel):
        code = ''
        code += f'{self.tab*tablevel}initial begin\n'
        code += f'{self.tab*(tablevel+1)}$monitor("%x => %x", srcsum, dst);\n'
        code += f'{self.tab*tablevel}end\n'
        return code

    def gen_test(self, tablevel, iteration=20):
        code = ''
        code += f'{self.tab*tablevel}initial begin\n'
        for i in range(iteration):
            code += f'{self.tab*(tablevel+1)}#1\n'
            for j, num in enumerate(self.gpcin):
                if num != 0:
                    code += f'{self.tab*(tablevel+1)}src{j} <= {num}\'h{random.randint(0,(1<<num)-1):x};\n'
        code += f'{self.tab*tablevel}end\n'
        return code

def main():
    src = open(sys.argv[1], 'r').read()
    gpc = gpctestgen(src)
    print(gpc.gen_module())

if __name__ == '__main__':
    main()
