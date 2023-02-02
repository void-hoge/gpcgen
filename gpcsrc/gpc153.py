self.gpcin = [5,1]
self.lut = {0:0xff00ff0069966996, 1:0xff00ff0017e817e8, 2:0x0, 3:0x0}
self.lutin = {
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
    ],
    2:[],
    3:[],
}
self.carry4in = {
    'props':{
        0:{'typ':'lut', 'idx':0, 'out':0},
        1:{'typ':'lut', 'idx':1, 'out':0},
        2:{},
        3:{},
    },
    'genes':{
        0:{'typ':'lut', 'idx':0, 'out':1},
        1:{'typ':'lut', 'idx':1, 'out':1},
        2:{},
        3:{},
    },
    'carry':{'typ':'gpc', 'place':0, 'idx':4}
}
self.gpcout = {
    0:{'typ':'carry4', 'idx':0},
    1:{'typ':'carry4', 'idx':1},
    2:{'typ':'carryout', 'idx':1},
}
