/* nokia 5110 lcd */
module nokia5110(){
    difference() {
        cube([43.87, 43.18, 1.4], center = true);
        nokia4Hole();
    }
    translate([0,0,2.4]){
        cube([40.64, 34.16, 3.5], center = true);
    }
}

module nokiaHole(){
    translate([20.3, 20, 0]){
        cylinder(h = 2, d = 2.32, center=true, $fn=120);
    }
}

module nokia2Hole(){
    nokiaHole();
    mirror(v= [180, 0, 0] ){
        nokiaHole();
    }
}

module nokia4Hole(){
    nokia2Hole();
    mirror(v= [0, 180, 0] ){
        nokia2Hole();
    }
}

/* arduino nano v3 */
module arduinoNano(){
    difference() {
        cube([17.65, 43.40, 1.58], center = true); 
        nano4Hole();
    }
    translate([0, 18.5, 2.7]){
        cube([7.6, 9.15, 3.83], center = true); 
    }
}

module nanoHole(){
    translate([8, 20.9, 0]){
            cylinder(h = 2, d = 1.42, center=true, $fn=120);
        }
}

module nano2Hole(){
    nanoHole();
    mirror(v= [180, 0, 0] ){
        nanoHole();
    }
}

module nano4Hole(){
    nano2Hole();
    mirror(v= [0, 180, 0] ){
        nano2Hole();
    }
}