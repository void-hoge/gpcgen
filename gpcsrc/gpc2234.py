self.gpcin = [3, 2, 2]
self.lut = {
    0:0xaaaaaaaa66666666,
    1:0xaaaaaaaa66666666,
    2:0xaaaaaaaa66666666,
    3:0x0,
}
self.lutin = {
    0:[
        {'typ':'gpc', 'place':0, 'idx':0},
        {'typ':'gpc', 'place':0, 'idx':1},
    ],
    1:[
        {'typ':'gpc', 'place':1, 'idx':0},
        {'typ':'gpc', 'place':1, 'idx':1},
    ],
    2:[
        {'typ':'gpc', 'place':2, 'idx':0},
        {'typ':'gpc', 'place':2, 'idx':1},
    ],
    3:[],
}
self.carry4in = {
    'props': {
        0:{'typ':'lut', 'idx':0, 'out':0},
        1:{'typ':'lut', 'idx':1, 'out':0},
        2:{'typ':'lut', 'idx':2, 'out':0},
    },
    'genes': {
        0:{'typ':'lut', 'idx':0, 'out':1},
        1:{'typ':'lut', 'idx':1, 'out':1},
        2:{'typ':'lut', 'idx':2, 'out':1},
    },
    'carry':{'typ':'gpc', 'place':0, 'idx':2},
}
self.gpcout = {
    0:{'typ':'carry4', 'idx':0},
    1:{'typ':'carry4', 'idx':1},
    2:{'typ':'carry4', 'idx':2},
    3:{'typ':'carryout', 'idx':2},
}
