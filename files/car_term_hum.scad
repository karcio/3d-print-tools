/* import sensors for design only */
use <sensors.scad>;
translate(v = [0, 0, 15]) {
    arduinoNano();
}
translate(v = [-32, 0, 15]) {
    nokia5110();
}
/* end of import */