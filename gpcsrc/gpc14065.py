gpcin = [6,0,4,1]
lut = {
    0:0x6996966996696996,
    1:0xe8e8e8e8177e7ee8,
    2:0xff00ff0069966996,
    3:0xff00ff0017e817e8
}
lutin = {
    0:[
        {'typ':'gpc', 'place':0, 'idx':0},
        {'typ':'gpc', 'place':0, 'idx':1},
        {'typ':'gpc', 'place':0, 'idx':2},
        {'typ':'gpc', 'place':0, 'idx':3},
        {'typ':'gpc', 'place':0, 'idx':4},
        {'typ':'gpc', 'place':0, 'idx':5},
    ],
    1:[
        {'typ':'gpc', 'place':0, 'idx':0},
        {'typ':'gpc', 'place':0, 'idx':1},
        {'typ':'gpc', 'place':0, 'idx':2},
        {'typ':'gpc', 'place':0, 'idx':3},
        {'typ':'gpc', 'place':0, 'idx':4},
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
carry4in = {
    'props':{
        0:{'typ':'lut', 'idx':0, 'out':0},
        1:{'typ':'lut', 'idx':1, 'out':0},
        2:{'typ':'lut', 'idx':2, 'out':0},
        3:{'typ':'lut', 'idx':3, 'out':0},
    },
    'genes':{
        0:{'typ':'lut', 'idx':0, 'out':1},
        1:{'typ':'lut', 'idx':1, 'out':1},
        2:{'typ':'lut', 'idx':2, 'out':1},
        3:{'typ':'lut', 'idx':3, 'out':1},
    },
    'carry':{}
}
gpcout = {
    0:{'typ':'carry4', 'idx':0},
    1:{'typ':'carry4', 'idx':1},
    2:{'typ':'carry4', 'idx':2},
    3:{'typ':'carry4', 'idx':3},
    4:{'typ':'carryout', 'idx':3},
}
