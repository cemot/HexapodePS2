module base(side){
difference(){
cube([20,30,3.5] , center = true);
translate([5,-10,0])cylinder (h=5,d=3.3, $fn=60, center = true);
translate([-5,-10,0])cylinder (h=5,d=3.3, $fn=60, center = true);
translate([5,0,0])cylinder (h=5,d=3.3, $fn=60, center = true);
translate([-5,0,0])cylinder (h=5,d=3.3, $fn=60, center = true);
}
difference(){
hull(){
translate([0,12,0])cube([20,14,3.5] , center = true);
translate([0,17,26])rotate([0,90,0]) cylinder (h=20,d=12, $fn=60, center = true);
}
translate([0,17,26]) rotate([0,90,0]) cylinder (h=40,d=4.2, $fn=60, center = true);
translate([0,17,26]) rotate([0,90,0]) cylinder (h=10.5,d=14, $fn=60, center = true);
translate([0,17,26]) cube([10.5,20,5] , center = true);
}
translate([side*10.5,12,0])difference(){
minkowski(){
cube([5,8,2.5] , center = true);
cylinder (h=1,d=4, $fn=60, center = true);
}
translate([0,-3,0]) cube([4,8,5] , center = true);
}
}

module renvoi(){
difference(){
cube([30,20,4] , center = true);
translate([5,-5,0])cylinder (h=5,d=3.3, $fn=60, center = true);
translate([-5,-5,0])cylinder (h=5,d=3.3, $fn=60, center = true);
translate([5,5,0])cylinder (h=5,d=3.3, $fn=60, center = true);
translate([-5,5,0])cylinder (h=5,d=3.3, $fn=60, center = true);
}
difference(){
union(){
hull(){
translate([12.7,0,0])cube([5,20,4] , center = true);
translate([12.7,0,10])rotate([0,90,0]) cylinder (h=5,d=15, $fn=60, center = true);
}
hull(){
translate([-12.7,0,0])cube([5,20,4] , center = true);
translate([-12.7,0,10])rotate([0,90,0]) cylinder (h=5,d=15, $fn=60, center = true);
}
}
translate([0,0,10]) rotate([0,90,0]) cylinder (h=40,d=4.2, $fn=60, center = true);
}
}



module bielette(){
intersection(){
rotate([0,0,0]) difference(){
translate([21.1,0,0])rotate([0,0,0]) cylinder (h=10,d=65, $fn=60, center = true);
translate([21.1,0,0])rotate([0,0,0]) cylinder (h=12,d=45, $fn=60, center = true);
translate([0,-17.5,0]) rotate([0,0,0]) cylinder (h=40,d=4.3, $fn=60, center = true);
translate([0,17.5,0]) rotate([0,0,0]) cylinder (h=40,d=4.3, $fn=60, center = true);
}
translate([-54,0,0])rotate([0,0,45])cube([100,100,12] , center = true);
}
difference(){
union(){
translate([0,17.5,0])rotate([0,0,0]) cylinder (h=10,d=10, $fn=60, center = true);
translate([0,-17.5,0])rotate([0,0,0]) cylinder (h=10,d=10, $fn=60, center = true);
}
translate([0,-17.5,0]) rotate([0,0,0]) cylinder (h=40,d=4.3, $fn=60, center = true);
translate([0,17.5,0]) rotate([0,0,0]) cylinder (h=40,d=4.3, $fn=60, center = true);
}
}



module pivot(angle){
difference(){
hull(){
hull(){
translate([0,-11,0])rotate([0,90,0]) cylinder (h=20,d=12, $fn=60, center = true);
translate([0,11,0])rotate([0,90,0]) cylinder (h=20,d=12, $fn=60, center = true);
}
intersection(){
translate([0,-10.5,23])rotate([0,90,0]) cylinder (h=20,d=18, $fn=60, center = true);
translate([0,-10.5,18])sphere($fn = 40,d = 26);
}
}
translate([0,-11,0]) rotate([0,90,0]) cylinder (h=40,d=4.2, $fn=60, center = true);
translate([0,11,0]) rotate([0,90,0]) cylinder (h=40,d=4.2, $fn=60, center = true);
hull(){
translate([0,15.5,2.5])rotate([0,90,0]) cylinder (h=10.5,d=12.1, $fn=60, center = true);
translate([0,11,0])rotate([0,90,0]) cylinder (h=10.5,d=12.1, $fn=60, center = true);
translate([0,-5,-7])rotate([0,90,0]) cylinder (h=10.5,d=1, $fn=60, center = true);
}

translate([0,-4,-14])rotate([45,0,0]) cube([22,20,20] , center = true);

translate([0,-24,23]) rotate([77.2,0,angle*5]) cylinder (h=40,d=10.3, $fn=60, center = true);

}
}




base(-1); // parametre 1(gauche) ou -1(droite) 
translate([0,40,0]) renvoi();
translate([0,100,0])  bielette();
translate([0,-60,0])pivot(1); // parametre 1(gauche) ou -1(droite) 

