gpcin = [5, 3, 1]
lut = {
    0:0xff00ff0069966996,
    1:0x17e8e817e81717e8,
    2:0x001717ffffe8e800,
    3:0x0,
}
lutin = {
    0:[
        {'typ':'gpc', 'place':0, 'idx':0},
        {'typ':'gpc', 'place':0, 'idx':1},
        {'typ':'gpc', 'place':0, 'idx':2},
        {'typ':'gpc', 'place':0, 'idx':3},
    ],
    1:[
        {'typ':'gpc', 'place':0, 'idx':0},
        {'typ':'gpc', 'place':0, 'idx':1},
        {'typ':'gpc', 'place':0, 'idx':2},
        {'typ':'gpc', 'place':1, 'idx':0},
        {'typ':'gpc', 'place':1, 'idx':1},
        {'typ':'gpc', 'place':1, 'idx':2},
    ],
    2:[
        {'typ':'gpc', 'place':0, 'idx':0},
        {'typ':'gpc', 'place':0, 'idx':1},
        {'typ':'gpc', 'place':0, 'idx':2},
        {'typ':'gpc', 'place':1, 'idx':0},
        {'typ':'gpc', 'place':1, 'idx':1},
        {'typ':'gpc', 'place':2, 'idx':0},
    ],
    3:[],
}
carry4in = {
    'props': {
        0:{'typ':'lut', 'idx':0, 'out':0},
        1:{'typ':'lut', 'idx':1, 'out':0},
        2:{'typ':'lut', 'idx':2, 'out':0},
    },
    'genes': {
        0:{'typ':'lut', 'idx':0, 'out':1},
        1:{'typ':'gpc', 'place':1, 'idx':2},
        2:{'typ':'gpc', 'place':2, 'idx':0},
    },
    'carry':{'typ':'gpc', 'place':0, 'idx':4}
}
gpcout = {
    0:{'typ':'carry4', 'idx':0},
    1:{'typ':'carry4', 'idx':1},
    2:{'typ':'carry4', 'idx':2},
    3:{'typ':'carryout', 'idx':2},
}
