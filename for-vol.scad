module hole()
{
     cylinder(r=2,h=10, $fn=50);
}

module screw_hole()
{
     union() {
          hole();
          translate(v=[0,0,4]) {
               cylinder(h=4, r1=2, r2=6, $fn=50);
          }
     }
}

module plane90x90()
{
     minkowski() {
          cube([90,90,2]);
          cylinder(r=2,h=2);
     }
}

module plane_with_holes() {
     difference() {
          plane90x90();
          translate(v=[8,8,-2]) hole();
          translate(v=[45,8,-2]) hole();
          translate(v=[82,8,-2]) hole();
          translate(v=[82,45,-2]) hole();
          translate(v=[82,82,-2]) hole();

          translate(v=[13,77,-2]) screw_hole();
          translate(v=[13,45,-2]) screw_hole();
          translate(v=[45,45,-2]) screw_hole();
          translate(v=[45,77,-2]) screw_hole();
          translate(v=[58,77,-2]) screw_hole();
          translate(v=[58,45,-2]) screw_hole();
          translate(v=[45,32,-2]) screw_hole();
          translate(v=[13,32,-2]) screw_hole();
     }
}

plane_with_holes();
