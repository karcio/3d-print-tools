$fn = 240;
thickness = 2;
module screwHole(){
    
    rb = 4.0;
    rs = 1.5;
    difference(){
        #cylinder(thickness, r1 = rb, r2 = rb);
        cylinder(thickness, r1 = rs, r2 = rs);
    }
}
module screwSmall(){
    lenght = 23.4;
    translate(v = [lenght / 2, 0, 0]) { 
            screwHole();
        }
}
module screwsSmall(){
    screwSmall();
    mirror(v= [180, 0, 0] ) { 
        screwSmall();
    }
}
module screwBig(){
    lenght = 27.35;
    translate(v = [lenght / 2, 0, 0]) { 
            screwHole();
    }
}
module screwsBig(){
    screwBig();
    mirror(v= [180, 0, 0] ) { 
        screwBig();
    }
}
module screwsBigMoved(){
    // yLenght = 36.10; -> too long distance
    yLenght = 35.10;
    translate(v = [0, yLenght, 0]) { 
        screwsBig();
    }
}
module slide(){
    translate(v = [7.73, 0, 0]) { 
        //rotate([0,0,-3]) { -> too long distance
        rotate([0,0,-3.15]) {
            //cube([8,36.10,thickness],false);
            cube([8,35.7,thickness],false);
        }
    }
}
module slides(){
    slide();
     mirror(v= [180, 0, 0] ) { 
        slide();
    }
}
module firstCube(){
    translate(v = [-15.7, 1.5, 0]) { 
        cube([31.5, 18.5, 15],false);
    }
}
module cutCube(){
    translate(v = [0, 5, 6]) { 
        rotate([30,0,0]) {
            firstCube();
        }
    }
}
module camHold(){
    difference(){
        firstCube();
        cutCube();
    }
}
module camHolder(){
    difference(){
        camHold();
        translate(v = [-7.5, 1, 02]) { 
            cube([15, 20, 3],false);
        }
    }
}
screwsSmall();
screwsBigMoved();
slides();
camHolder();