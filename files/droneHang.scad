thickness = 4.0;

module mainFrame(){
    cube([120,20,thickness],center=true);
}
 
 module cutter(){
    rotate([0, 0, 45]) {
        translate(v = [45, -45, 0]) {  
            cube([50, 20, thickness], center=true);
        }
    }
}

module cutters(){
    cutter();
    mirror(v= [180, 0, 0] ) {
        cutter();
    }
}

module frameCutted(){
    difference() {
        mainFrame();
        cutters();
    }
}

module holder(){
    translate(v = [45.9, -0.8, 15.5]) {  
        rotate([0, 0, 45]) {
            cube([22, thickness, 35], center=true);
        }
    }
}

module holders(){
    holder();
     mirror(v= [180, 0, 0] ) {
        holder();
    }
}

union (){
    frameCutted();
    holders();
}
   