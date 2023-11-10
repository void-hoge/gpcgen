#!/usr/bin/env python3

import sys
from gpcgen import gpcgen

class gpccodegen(gpcgen):
    def __init__(self, src):
        super().__init__(src)
        self.tab = '    '

    def gen_module(self, tablevel=0):
        code = ''
        code += self.tab*tablevel + f'module {self.gpcname}('
        code += ', '.join(self.get_module_args())
        code += ');\n'
        code += self.gen_wire_declarations(tablevel+1)
        code += self.gen_lut_instantations(tablevel+1)
        code += self.gen_gp_assignments(tablevel+1)
        code += self.gen_carry4_instantation(tablevel+1)
        code += self.gen_dst_assignments(tablevel+1)
        code += self.tab*tablevel + f'endmodule\n'
        return code

    def get_module_args(self):
        args = []
        for place, num in enumerate(self.gpcin):
            if num != 0:
                args.append(f'input wire[{num-1}:0]src{place}')
        args.append(f'output wire[{len(self.gpcout)-1}:0]dst')
        return args

    def gen_wire_declarations(self, tablevel):
        code = ''
        for idx, ports in self.lutout.items():
            if len(ports) != 0:
                code += self.tab*tablevel+f'wire[{len(ports)-1}:0] lut{idx}_out;\n'
        outports = [port.get('typ', None) for place, port in self.gpcout.items()]
        if 'carry4' in outports or \
           'carryout' in outports:
            code += self.tab*tablevel+f'wire[3:0] genes;\n'
            code += self.tab*tablevel+f'wire[3:0] props;\n'
            code += self.tab*tablevel+f'wire[3:0] carry4_out;\n'
            code += self.tab*tablevel+f'wire[3:0] carry4_carryout;\n'
        return code

    def get_lut_args(self, lutidx, lut5out=None):
        args = []
        srcs = self.lutin[lutidx]
        for i in range(len(srcs)):
            typ = srcs[i].get('typ')
            if typ == 'gpc':
                place = srcs[i]['place']
                idx = srcs[i]['idx']
                args.append(f'.I{i}(src{place}[{idx}])')
            elif typ == 'lut':
                idx = srcs[i]['idx']
                out = srcs[i]['idx']
                args.append(f'.I{i}(lut{idx}_out[{out}])')
            else:
                print(f'Invalid LUT src type "{typ}".', file=sys.stderr)
                raise
        if self.luttype[lutidx] == 'LUT6_2':
            args.append(f'.O6(lut{lutidx}_out[0])')
            args.append(f'.O5(lut{lutidx}_out[1])')
        elif self.luttype[lutidx] == 'LUT5':
            args.append(f'.O(lut{lutidx}_out[{lut5out}])')
        elif self.luttype[lutidx] == 'LUT6':
            args.append(f'.O(lut{lutidx}_out[0])')
        else:
            print(f'Invalid LUT type "{self.luttype[lutidx]}".', file=sys.stderr)
            raise
        return args
    
    def gen_lut6_instantation(self, tablevel, lutidx):
        if self.luttype[lutidx] != 'LUT6':
            print(f'lut{lutidx} is not a LUT6 but {self.luttype[lutidx]}')
            raise
        code = ''
        code += self.tab*tablevel
        code += 'LUT6 #(\n'
        code += self.tab*(tablevel+1)
        code += f'.INIT(64\'h{self.lut[lutidx]:16x})\n'
        code += self.tab*tablevel
        code += f')lut{lutidx}_inst (\n'
        args = self.get_lut_args(lutidx)
        code += self.tab*(tablevel+1)
        code += f',\n{self.tab*(tablevel+1)}'.join(args)
        code += '\n'
        code += self.tab*tablevel
        code += f');\n'
        return code

    def gen_lut6_2_instantation(self, tablevel, lutidx):
        if self.luttype[lutidx] != 'LUT6_2':
            print(f'lut{lutidx} is not a LUT6_2 but {self.luttype[lutidx]}.')
            raise
        code = ''
        code += self.tab*tablevel
        code += 'LUT6_2 #(\n'
        code += self.tab*(tablevel+1)
        code += f'.INIT(64\'h{self.lut[lutidx]:16x})\n'
        code += self.tab*tablevel
        code += f') lut{lutidx}_inst (\n'
        args = self.get_lut_args(lutidx)
        code += self.tab*(tablevel+1)
        code += f',\n{self.tab*(tablevel+1)}'.join(args)
        code += '\n'
        code += self.tab*tablevel
        code += f');\n'
        return code

    def gen_lut5_instantation(self, tablevel, lutidx):
        if self.luttype[lutidx] != 'LUT5':
            print(f'lut{lutidx} is not a LUT5 but {self.luttype[lutidx]}.')
            raise
        code = ''
        init = [self.lut[lutidx] & 0xffffffff, self.lut[lutidx]>>32]
        for out in range(2):
            code += self.tab*tablevel
            code += 'LUT5 #(\n'
            code += self.tab*(tablevel+1)
            code += f'.INIT(32\'h{init[out]:8x})\n'
            code += self.tab*tablevel
            code += f') lut{lutidx}_{out}_inst (\n'
            args = self.get_lut_args(lutidx, out)
            code += self.tab*(tablevel+1)
            code += f',\n{self.tab*(tablevel+1)}'.join(args)
            code += '\n'
            code += self.tab*tablevel
            code += f');\n'
        return code            

    def gen_lut_instantations(self, tablevel):
        code = ''
        for lutidx in range(4):
            if self.luttype[lutidx] == 'LUT5':
                code += self.gen_lut5_instantation(tablevel, lutidx)
            elif self.luttype[lutidx] == 'LUT6':
                code += self.gen_lut6_instantation(tablevel, lutidx)
            elif self.luttype[lutidx] == 'LUT6_2':
                code += self.gen_lut6_2_instantation(tablevel, lutidx)
        return code

    def gen_gp_assignments(self, tablevel):
        code = ''
        ports = [port.get('typ', None) for port in self.gpcout.values()]
        if 'carry4' not in ports and 'carryout' not in ports:
            return code
        for gp in ['props', 'genes']:
            for i, port in self.carry4in[gp].items():
                code += self.tab*tablevel
                code += f'assign {gp}[{i}] = '
                if port:
                    if port.get('typ', None) == 'lut':
                        idx = port['idx']
                        out = port['out']
                        code += f'lut{idx}_out[{out}];\n'
                    elif port.get('typ', None) == 'gpc':
                        place = port['place']
                        idx = port['idx']
                        code += f'src{place}[{idx}];\n'
                else:
                    code += '1\'h0;\n'
        return code

    def gen_carry4_instantation(self, tablevel):
        code = ''
        ports = [port.get('typ', None) for port in self.gpcout.values()]
        if 'carry4' not in ports and 'carryout' not in ports:
            return code
        code += self.tab*tablevel
        code += 'CARRY4 CARRY4_inst (\n'
        args = [
            '.CO(carry4_carryout)',
            '.O(carry4_out)',
        ]
        cyinit = self.carry4in['carry']
        if cyinit.get('typ', None) == 'gpc':
            place = cyinit['place']
            idx = cyinit['idx']
            args.append(f'.CYINIT(src{place}[{idx}])')
        elif cyinit.get('typ', None) == 'lut':
            idx = cyinit['idx']
            out = cyinit['out']
            args.append(f'.CYINIT(lut{idx}_out[{out}])')
        else:
            args.append(f'.CYINIT(1\'h0)')
        args.append('.DI(genes)')
        args.append('.S(props)')
        code += self.tab*(tablevel+1)
        code += f',\n{self.tab*(tablevel+1)}'.join(args)
        code += '\n'
        code += self.tab*tablevel
        code += ');\n'
        return code

    def gen_dst_assignments(self, tablevel):
        code = ''
        for place, port in self.gpcout.items():
            if port.get('typ', None) == 'carry4':
                idx = port['idx']
                wire = f'carry4_out[{idx}]'
            elif port.get('typ', None) == 'carryout':
                idx = port['idx']
                wire = f'carry4_carryout[{idx}]'
            elif port.get('typ', None) == 'lut':
                idx = port['idx']
                out = port['out']
                wire = f'lut{idx}_out[{out}]'
            else: # gpc
                place = port['place']
                idx = port['idx']
                wire = f'src{place}[{idx}]'
            code += self.tab*tablevel+f'assign dst[{place}] = {wire};\n'
        return code

def main():
    src = open(sys.argv[1], 'r').read()
    gpc = gpccodegen(src)
    print(gpc.gen_module())

if __name__ == '__main__':
    main()
