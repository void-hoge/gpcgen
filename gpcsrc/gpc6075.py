self.gpcin = [7, 0, 6]
self.lut = {
    0:0x6996966996696996,
    1:0xe8e8e8e8177e7ee8,
    2:0x6996966996696996,
    3:0xe8e8e8e8177e7ee8,
}
self.lutin = {
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
        {'typ':'gpc', 'place':2, 'idx':4},
        {'typ':'gpc', 'place':2, 'idx':5},

    ],
    3:[
        {'typ':'gpc', 'place':2, 'idx':0},
        {'typ':'gpc', 'place':2, 'idx':1},
        {'typ':'gpc', 'place':2, 'idx':2},
        {'typ':'gpc', 'place':2, 'idx':3},
        {'typ':'gpc', 'place':2, 'idx':4},
    ],
}
self.carry4in = {
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
    'carry':{'typ':'gpc', 'place':0, 'idx':6}
}
self.gpcout = {
    0:{'typ':'carry4', 'idx':0},
    1:{'typ':'carry4', 'idx':1},
    2:{'typ':'carry4', 'idx':2},
    3:{'typ':'carry4', 'idx':3},
    4:{'typ':'carryout', 'idx':3},
}
