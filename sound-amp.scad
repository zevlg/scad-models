use <utils.scad>;

$fn = 50;

function expCone2d(right, exp_div) =
     [for (x=steps(0,right,$fn)) [x, exp(x/(right/exp_div))-1]];

foot_r = 4;
module cone_foot(height) {
     cylinder(r=foot_r, h=height);
}

module cone_nose(radius, exp_div) {
     union() {
          rotate_extrude(convexity = 10)
               translate([-radius, 0, 0])
               polygon(points=concat([expCone2d(radius, exp_div), [[radius, 0]]]));

          fh = exp(exp_div) + 10;
          pos = radius - foot_r;
          translate(v=[0,pos,0]) cone_foot(fh);
          translate(v=[pos,0,0]) cone_foot(fh);
          translate(v=[-pos,0,0]) cone_foot(fh);
          translate(v=[0,-pos,0]) cone_foot(fh);
          /* translate(v=[0,0,4]) */
          /*      cylinder(r=2, h=100); */
     }
}



cone_nose(50, 4);
