#!/usr/bin/env python3

import random
import sys

def bin2int(binlist):
    return sum([num<<i for i, num in enumerate(binlist)])

def int2bin(num, width):
    return [1 if num&(1<<i) else 0 for i in range(width)]

class gpcgen:
    def __init__(self, src):
        exec(src)
        self.lutinwidth = {i:len(self.lutin[i]) for i in range(4)}
        self.luttype = {i:'' for i in range(4)}
        self.lutout = {i:{} for i in range(4)}
        self.gpcname = f'gpc{"".join(map(str, self.gpcin[::-1]))}_{len(self.gpcout)}'
        self.check_luttype()
        self.carryunit = { # (g,p,c)
            (0,0,0): {'carry':0, 'out':0},
            (0,0,1): {'carry':0, 'out':1},
            (0,1,0): {'carry':0, 'out':1},
            (0,1,1): {'carry':1, 'out':0},
            (1,0,0): {'carry':1, 'out':0},
            (1,0,1): {'carry':1, 'out':1},
            (1,1,0): {'carry':0, 'out':1},
            (1,1,1): {'carry':1, 'out':0},
        }

    def check_luttype(self):
        for idx, ports in self.lutin.items():
            for i, port in enumerate(ports):
                if port.get('typ', None) == 'lut':
                    lidx = port['idx']
                    lout = port['out']
                    self.lutout[lidx][lout] = {'typ':'lut', 'idx':idx, 'pos':i}
        for idx, port in self.carry4in['props'].items():
            if port.get('typ', None) == 'lut':
                lidx = port['idx']
                lout = port['out']
                self.lutout[lidx][lout] = {'typ':'props', 'pos':idx}
        for idx, port in self.carry4in['genes'].items():
            if port.get('typ', None) == 'lut':
                lidx = port['idx']
                lout = port['out']
                self.lutout[lidx][lout] = {'typ':'genes', 'pos':idx}
        for i in range(4):
            if len(self.lutout[i]) == 2:
                if self.lutinwidth[i] <= 5:
                    self.luttype[i] = 'LUT5'
                else:
                    self.luttype[i] = 'LUT6_2'
            elif len(self.lutout[i]) == 1:
                self.luttype[i] = 'LUT6'
            else:
                self.luttype[i] = ''

    def carry4sim(self, genes, props, cin):
        if len(genes) < 4:
            return
        if len(props) < 4:
            return
        out = []
        carry = cin
        carryout = []
        for i in range(4):
            cunit = self.carryunit[(genes[i], props[i], carry)]
            carry = cunit['carry']
            carryout.append(carry)
            out.append(cunit['out'])
        return out, carryout

    def emulate_lut(self, src, idx, out):
        if self.luttype[idx] == 'LUT5':
            lutsrc = [0 for _ in range(5)]
        else:
            lutsrc = [0 for _ in range(6)]
        for i, port in enumerate(self.lutin[idx]):
            if i >= len(lutsrc):
                continue
            if port.get('typ', None) == 'gpc':
                place = port['place']
                pidx = port['idx']
                lutsrc[i] = src[place][pidx]
            elif port.get('typ', None) == 'lut':
                lidx = port['idx']
                out = lidx['out']
                lutsrc[i] = self.emulate_lut(src, lidx, out)
        if self.luttype[idx] == 'LUT5':
            lutsrc.append(out)
        elif self.luttype[idx] == 'LUT6_2' and out == 1:
            lutsrc[5] = 0
        return 1 if self.lut[idx] & 1<<bin2int(lutsrc) else 0

    def emulate_carry4(self, src):
        props = [0 for _ in range(4)]
        genes = [0 for _ in range(4)]
        carry = 0
        for i, port in self.carry4in['props'].items():
            if port.get('typ', None) == 'lut':
                idx = port['idx']
                out = port['out']
                props[i] = self.emulate_lut(src, idx, out)
            elif port.get('typ', None) == 'gpc':
                place = port['place']
                idx = port['idx']
                props[i] = src[place][idx]
        for i, port in self.carry4in['genes'].items():
            if port.get('typ', None) == 'lut':
                idx = port['idx']
                out = port['out']
                genes[i] = self.emulate_lut(src, idx, out)
            elif port.get('typ', None) == 'gpc':
                place = port['place']
                idx = port['idx']
                genes[i] = src[place][idx]
        port = self.carry4in['carry']
        if port.get('typ', None) == 'lut':
            idx = port['idx']
            out = port['out']
            carry = self.emulate_lut(src, idx, out)
        elif port.get('typ', None) == 'gpc':
            place = port['place']
            idx = port['idx']
            carry = src[place][idx]
        return self.carry4sim(genes, props, carry)

    def get_random_src(self):
        return {i:int2bin(random.randint(0,(1<<num)-1), num) for i, num
                in enumerate(self.gpcin)}

    def emulate(self, src):
        dst = {i:[] for i in range(len(self.gpcout))}
        carry4, carryout = self.emulate_carry4(src)
        for i, port in self.gpcout.items():
            if port.get('typ', None) == 'carry4':
                idx = port['idx']
                dst[i].append(carry4[idx])
            elif port.get('typ', None) == 'carryout':
                idx = port['idx']
                dst[i].append(carryout[idx])
        return dst

    def random_test(self):
        src = self.get_random_src()
        emlt = self.emulate(src)
        return sum([sum(nums)<<i for i, nums in src.items()]),\
            sum([sum(nums)<<i for i, nums in emlt.items()])

    def test(self, iteration = 1000):
        for _ in range(iteration):
            a, b = self.random_test()
            print(a, b, file=sys.stderr)
            if a != b:
                print('FAIL', file=sys.stderr)
                return False
        print('PASS', file=sys.stderr)
        return True

def main():
    src = open(sys.argv[1], 'r').read()
    gpc = gpcgen(src)
    gpc.test()

if __name__ == '__main__':
    main()
