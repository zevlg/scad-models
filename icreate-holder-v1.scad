module prism(l, w, h) {
       polyhedron(points=[
               [0,0,h],           // 0    front top corner
               [0,0,0],[w,0,0],   // 1, 2 front left & right bottom corners
               [0,l,h],           // 3    back top corner
               [0,l,0],[w,l,0]    // 4, 5 back left & right bottom corners
       ], faces=[ // points for all faces must be ordered clockwise when looking in
               [0,2,1],    // top face
               [3,4,5],    // base face
               [0,1,4,3],  // h face
               [1,2,5,4],  // w face
               [0,3,5,2],  // hypotenuse face
       ]);
}

module left_side() {
     union() {
          translate(v=[0,0,6]) rotate([0,-180,-90]) prism(11, 3, 4);
          difference() {
               rotate([0,0,-90]) prism(11,4,12);
               translate(v=[0,-5,6]) cube([12,12,12]);
          }
     }
}

module right_side() {
     /* TODO: make it little bit bigger */
     union() {
          translate(v=[0,0,6]) rotate([0,180,-90]) prism(11,2,6);
          translate(v=[0,0,2]) rotate([0,0,-90]) prism(11,1,3.5);
          translate(v=[0,0,6]) cube([11,2,2]);
          translate(v=[0,-3,8]) cube([11,5,2]);
     }
}

module plate() {
     cube([11,98,2]);
}

module irobot2_plate() {
     union() {
          plate();
          left_side();
          translate(v=[0,98,0]) right_side();
     }
}

rotate([0,-90,0]) irobot2_plate();
