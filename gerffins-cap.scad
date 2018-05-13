module cap_bottom() {
     union () {
          cylinder(r=5, h=3, $fn=50);
          cylinder(r=3.62, h=5.5, $fn=50);
     }
}

module cap_top() {
     union () {
          cylinder(r=5, h=3.7, $fn=50);
          cylinder(r=3.62, h=6.2, $fn=50);
     }
}
               
cap_top();
