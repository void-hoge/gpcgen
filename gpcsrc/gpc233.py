gpcin = [3, 2]
lut = {
    0:0xaaaaaaaa66666666,
    1:0xaaaaaaaa66666666,
    2:0x0,
    3:0x0,
}
lutin = {
    0:[
        {'typ':'gpc', 'place':0, 'idx':0},
        {'typ':'gpc', 'place':0, 'idx':1},
    ],
    1:[
        {'typ':'gpc', 'place':1, 'idx':0},
        {'typ':'gpc', 'place':1, 'idx':1},
    ],
    2:[],
    3:[],
}
carry4in = {
    'props': {
        0:{'typ':'lut', 'idx':0, 'out':0},
        1:{'typ':'lut', 'idx':1, 'out':0},
    },
    'genes': {
        0:{'typ':'lut', 'idx':0, 'out':1},
        1:{'typ':'lut', 'idx':1, 'out':1},
    },
    'carry':{'typ':'gpc', 'place':0, 'idx':2},
}
gpcout = {
    0:{'typ':'carry4', 'idx':0},
    1:{'typ':'carry4', 'idx':1},
    2:{'typ':'carryout', 'idx':1},
}
