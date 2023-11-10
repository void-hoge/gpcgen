gpcin = [3]
lut = {
    0:0xaaaaaaaa66666666,
    1:0x0,
    2:0x0,
    3:0x0,
}
lutin = {
    0:[
        {'typ':'gpc', 'place':0, 'idx':0},
        {'typ':'gpc', 'place':0, 'idx':1},
    ],
    1:[],
    2:[],
    3:[],
}
carry4in = {
    'props': {
        0:{'typ':'lut', 'idx':0, 'out':0},
    },
    'genes': {
        0:{'typ':'lut', 'idx':0, 'out':1},
    },
    'carry':{'typ':'gpc', 'place':0, 'idx':2},
}
gpcout = {
    0:{'typ':'carry4', 'idx':0},
    1:{'typ':'carryout', 'idx':0},
}
