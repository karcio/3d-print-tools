// battery dimentions
h_batt = 68;
d_batt = 20;

module oneBatt(){
    translate(v = [10.5, 0, 6]) {
        rotate([90,0,0]) {
            cylinder(h = h_batt, d = d_batt, center = true, $fn = 120);
        }
    }
}

module twoBatt(){
    translate(v = [2, -2, 0]) {
        oneBatt();
        mirror(v= [1, 0, 0] ) {
            oneBatt();
        }
    }
}

module rawCase(){
    cube([48,78,12],center=true);
}

module topSpacer(){
    translate(v = [1, 34.7, 2.5]) {
        cube([43,5.7,7],center=true);
    }
}
 
module leftSpacer(){
     translate(v = [-21, 0, 2.5]) {
       cube([3.5,75,7],center=true);
     }
}

module bottomSpacer(){
    translate(v = [1, -36.7, 2.5]) {
        cube([43.5,1.45,7],center=true);
    }
}

module battSpacer(){
    translate(v = [2, 0, 2.5]) {
        cube([10,73,7],center=true);
    }
}

module holeOut(){
     translate(v = [-19.1, 38,6 ]) {
         rotate([90,0,0]) {
            cylinder(h = 20, d = 7,5, center = true, $fn = 120);
         }
      }
}

module batChecker(){ 
    translate(v = [-23.2, 0, 4.9]) {
        cube([2,37,2.3],center=true);
    }
}

module caseCutBatt(){
    difference() {
        rawCase();
        twoBatt();
    }
}
  
module caseCutTopSpacer(){
    difference() {
        caseCutBatt();
        topSpacer();
    }
}
  
module caseCutLeftSpacer(){
    difference() {
        caseCutTopSpacer();
        leftSpacer();
    }
}

module caseCutBottomSpacer(){
    difference() {
        caseCutLeftSpacer();
        bottomSpacer();
    }
} 

module caseCutholeOut(){
    difference() {
        caseCutBottomSpacer();
        holeOut();
    }
} 

module caseCutBattSpacer(){
    difference() {
        caseCutholeOut();
        battSpacer();
    }
} 

module caseCutBattChecker(){
    difference() {
        caseCutBattSpacer();
        batChecker();
    }
}

module screw(){
    difference() {
        cylinder(h = 12, d = 8, center = true, $fn = 120);
        cylinder(h = 12, d = 3, center = true, $fn = 120);
    }
}

module screw1(){
    translate(v = [20, 41.6,0 ]) {
        screw();
    }
}

module screw2(){
    screw1();
    mirror(v= [0, 1, 0] ) {
        screw1();
    }
}

module screw3(){
    mirror(v= [1, 0, 0] ) {
        screw1();
    }
}

module screw4(){
    mirror(v= [0, 1, 0] ) {
        screw3();
    }
}

module filler(){
    translate(v = [23.3, 40,0  ]) {
        cube([1.3,4,12],center=true);
    }
    translate(v = [16.66, 40,0  ]) {
        cube([1.3,4,12],center=true);
    }
}

module filler1(){
    mirror(v= [0, 1, 0] ) {
        filler();
    }
}

module filler2(){
    mirror(v= [1, 0, 0] ) {
        filler();
    }
}

module filler3(){
    mirror(v= [0, 1, 0] ) {
        filler2();
    }
}

module finalCase(){
    union(){
        caseCutBattChecker();
        screw2();
        screw4();
        filler();
        filler1();
        filler3();
    }
}

!finalCase();

mirror(v= [1, 0, 0] ) { 
    translate(v = [60, 0, 0]) {
        finalCase(); 
    }
}