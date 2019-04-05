$fn = 120;
thickness = 2;

module ring(){
    radius = 13.95;
    cylinder(thickness, radius, radius);    
}

module mainHole(){
    //radius = 4.7;
    radius = 5;
    cylinder(thickness, radius, radius);
}

module ringCutMainHole(){
    difference() {
        ring();
        mainHole();
    }
}

module shortScrew(){
    move = 8;
    translate(v = [move, 0, 0]){
        //radius = 1.3;
        radius = 2;
        cylinder(thickness, radius, radius);
    }
}

module shotScrewMirrored(){
    shortScrew();
    rotate = 180;
    mirror(v= [rotate, 0, 0] ) {
       shortScrew();
    } 
}

module ringCutShortScrews(){
    difference() {
        ringCutMainHole();
        shotScrewMirrored();
    }
 }
 
module longScrew(){
    rotate([0,0,90]) { 
        move = 10;
        translate(v = [move, 0, 0]){
            //radius = 1.3;
            radius = 2;
            cylinder(thickness, radius, radius);
        }
    }
}

module longScrewMirrored(){
    longScrew();
    rotate = 180;
    mirror(v= [0, rotate, 0] ) {
       longScrew();
    } 
 }
 
 module ringCutLongScrews(){
     difference() {
         ringCutShortScrews();
         longScrewMirrored();
     }
 }
 
 ringCutLongScrews();