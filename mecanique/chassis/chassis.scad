epaisseur =4;
largeur = 120;      
hauteur = 51;
eccart_servo=125;    
longueur_vis =12;


module trou_servo(){
translate([0,-7,0])circle(d=2.9,$fn=60);
translate([0,7,0])circle(d=2.9,$fn=60);
translate([-7,0,0])circle(d=2.9,$fn=60);
translate([7,0,0])circle(d=2.9,$fn=60);
translate([0,0,0])circle(d=5.9,$fn=60);
}


module bottom(epaisseur,largeur,eccart_servo){
difference(){
union(){
translate([0,-largeur/2,0])hull(){
circle(d=26,$fn=60);
translate([0,20,0]) square([50,1],center=true);
}
translate([0,largeur/2,0])hull(){
circle(d=26,$fn=60);
translate([0,-20,0]) square([50,1],center=true);
}

translate([eccart_servo,-largeur/2,0]) rotate([0,0,45]) hull(){
circle(d=26,$fn=60);
translate([0,60,0]) square([60,1],center=true);
}
translate([-eccart_servo,-largeur/2,0]) rotate([0,0,-45]) hull(){
circle(d=26,$fn=60);
translate([0,60,0]) square([60,1],center=true);
}

translate([eccart_servo,largeur/2,0]) rotate([0,0,-45]) hull(){
circle(d=26,$fn=60);
translate([0,-60,0]) square([60,1],center=true);
}
translate([-eccart_servo,largeur/2,0]) rotate([0,0,45]) hull(){
circle(d=26,$fn=60);
translate([0,-60,0]) square([60,1],center=true);
}

square([2*eccart_servo-40,largeur-30],center=true);

    }

translate([(eccart_servo-50),20,0]) circle(d=3.9,$fn=40);
translate([-(eccart_servo-50),20,0]) circle(d=3.9,$fn=40);
translate([(eccart_servo-50),-20,0]) circle(d=3.9,$fn=40);
translate([-(eccart_servo-50),-20,0]) circle(d=3.9,$fn=40);

translate([0,-largeur/2,0]) trou_servo();
translate([eccart_servo,-largeur/2,0]) rotate([0,0,45]) trou_servo();
translate([-eccart_servo,-largeur/2,0]) rotate([0,0,-45]) trou_servo();
translate([0,largeur/2,0]) trou_servo();
translate([eccart_servo,largeur/2,0]) rotate([0,0,45]) trou_servo();
translate([-eccart_servo,largeur/2,0]) rotate([0,0,-45]) trou_servo();

translate([(eccart_servo-20),-(largeur/2-20),0]) rotate([0,0,45])hull(){
translate([0,-6,0]) circle(d=4,$fn=60);
translate([0,6,0]) circle(d=4,$fn=60);
}
translate([(eccart_servo-20),(largeur/2-20),0]) rotate([0,0,-45])hull(){
translate([0,-6,0]) circle(d=4,$fn=60);
translate([0,6,0]) circle(d=4,$fn=60);
}
translate([-(eccart_servo-20),-(largeur/2-20),0]) rotate([0,0,-45])hull(){
translate([0,-6,0]) circle(d=4,$fn=60);
translate([0,6,0]) circle(d=4,$fn=60);
}
translate([-(eccart_servo-20),(largeur/2-20),0]) rotate([0,0,45])hull(){
translate([0,-6,0]) circle(d=4,$fn=60);
translate([0,6,0]) circle(d=4,$fn=60);
}


// renfort avant
translate([eccart_servo-35,0,0]){
translate([0,-20,0])square([epaisseur,10],center=true);
circle(d=3.9,$fn=60);
translate([0,20,0])square([epaisseur,10],center=true);
}

// renfort arriere
translate([-(eccart_servo-35),0,0]){
translate([0,-20,0])square([epaisseur,10],center=true);
circle(d=3.9,$fn=60);
translate([0,20,0])square([epaisseur,10],center=true);
}

// renfort lateraux
translate([0,(largeur/2-25),0]){
translate([0,0,0])square([10,epaisseur],center=true);
translate([-((eccart_servo-20)/4),0,0])circle(d=3.9,$fn=60);
translate([((eccart_servo-20)/4),0,0])circle(d=3.9,$fn=60);
translate([-2*((eccart_servo-20)/4),0,0])square([10,epaisseur],center=true);
translate([2*((eccart_servo-20)/4),0,0])square([10,epaisseur],center=true);
translate([-3*((eccart_servo-20)/4),0,0])circle(d=3.9,$fn=60);
translate([3*((eccart_servo-20)/4),0,0])circle(d=3.9,$fn=60);
}
translate([0,-(largeur/2-25),0]){
translate([0,0,0])square([10,epaisseur],center=true);
translate([-((eccart_servo-20)/4),0,0])circle(d=3.9,$fn=60);
translate([((eccart_servo-20)/4),0,0])circle(d=3.9,$fn=60);
translate([-2*((eccart_servo-20)/4),0,0])square([10,epaisseur],center=true);
translate([2*((eccart_servo-20)/4),0,0])square([10,epaisseur],center=true);
translate([-3*((eccart_servo-20)/4),0,0])circle(d=3.9,$fn=60);
translate([3*((eccart_servo-20)/4),0,0])circle(d=3.9,$fn=60);
}
}
}

module top(epaisseur,largeur,eccart_servo){
difference(){
bottom(epaisseur,largeur,eccart_servo);
square([2*eccart_servo-90,largeur-65],center=true);
}
}

module renfort_l(epaisseur,hauteur,largeur,longueur_vis){

difference(){
union(){
square([hauteur+0.2,64-epaisseur],center=true);
translate([(hauteur+0.2)/2 + epaisseur/2,-20,0])square([epaisseur,10],center=true);
translate([(hauteur+0.2)/2 + epaisseur/2,20,0])square([epaisseur,10],center=true);
translate([-((hauteur+0.2)/2 + epaisseur/2),-20,0])square([epaisseur,10],center=true);
translate([-((hauteur+0.2)/2 + epaisseur/2),20,0])square([epaisseur,10],center=true);
}
translate([(hauteur+0.2-longueur_vis+epaisseur-1)/2,0,0])square([longueur_vis-epaisseur +1,4],center=true);
translate([(hauteur/2-epaisseur-2),0,0])square([3.2,6.6],center=true);
translate([-(hauteur+0.2-longueur_vis+epaisseur-1)/2,0,0])square([longueur_vis-epaisseur +1,4],center=true);
translate([-(hauteur/2-epaisseur-2),0,0])square([3.2,6.6],center=true);
hull(){
translate([4,8,0]) circle(d=10,$fn=60);
translate([4,-8,0]) circle(d=10,$fn=60);
}
}
}


module renfort_L(epaisseur,hauteur,largeur,longueur_vis,eccart_servo){

difference(){
union(){
square([6*((eccart_servo-20)/4)+30,hauteur+0.2],center=true);
translate([0,(hauteur+0.2)/2 + epaisseur/2,0])square([10,epaisseur],center=true);
translate([-2*((eccart_servo-20)/4),(hauteur+0.2)/2 + epaisseur/2,0])square([10,epaisseur],center=true);
translate([2*((eccart_servo-20)/4),(hauteur+0.2)/2 + epaisseur/2,0])square([10,epaisseur],center=true);
translate([0,-((hauteur+0.2)/2 + epaisseur/2),0])square([10,epaisseur],center=true);
translate([-2*((eccart_servo-20)/4),-((hauteur+0.2)/2 + epaisseur/2),0])square([10,epaisseur],center=true);
translate([2*((eccart_servo-20)/4),-((hauteur+0.2)/2 + epaisseur/2),0])square([10,epaisseur],center=true);
}
translate([-((eccart_servo-20)/4),(hauteur+0.2-longueur_vis+epaisseur-1)/2,0])rotate([0,0,90]) square([longueur_vis-epaisseur +1,4],center=true);
translate([-((eccart_servo-20)/4),(hauteur/2-epaisseur-2),0]) square([6.6,3.2],center=true);
translate([((eccart_servo-20)/4),(hauteur+0.2-longueur_vis+epaisseur-1)/2,0])rotate([0,0,90]) square([longueur_vis-epaisseur +1,4],center=true);
translate([((eccart_servo-20)/4),(hauteur/2-epaisseur-2),0]) square([6.6,3.2],center=true);
translate([3*((eccart_servo-20)/4),(hauteur+0.2-longueur_vis+epaisseur-1)/2,0])rotate([0,0,90]) square([longueur_vis-epaisseur +1,4],center=true);
translate([3*((eccart_servo-20)/4),(hauteur/2-epaisseur-2),0]) square([6.6,3.2],center=true);
translate([-3*((eccart_servo-20)/4),(hauteur+0.2-longueur_vis+epaisseur-1)/2,0])rotate([0,0,90]) square([longueur_vis-epaisseur +1,4],center=true);
translate([-3*((eccart_servo-20)/4),(hauteur/2-epaisseur-2),0]) square([6.6,3.2],center=true);

translate([-((eccart_servo-20)/4),-(hauteur+0.2-longueur_vis+epaisseur-1)/2,0])rotate([0,0,90]) square([longueur_vis-epaisseur +1,4],center=true);
translate([-((eccart_servo-20)/4),-(hauteur/2-epaisseur-2),0]) square([6.6,3.2],center=true);
translate([((eccart_servo-20)/4),-(hauteur+0.2-longueur_vis+epaisseur-1)/2,0])rotate([0,0,90]) square([longueur_vis-epaisseur +1,4],center=true);
translate([((eccart_servo-20)/4),-(hauteur/2-epaisseur-2),0]) square([6.6,3.2],center=true);
translate([3*((eccart_servo-20)/4),-(hauteur+0.2-longueur_vis+epaisseur-1)/2,0])rotate([0,0,90]) square([longueur_vis-epaisseur +1,4],center=true);
translate([3*((eccart_servo-20)/4),-(hauteur/2-epaisseur-2),0]) square([6.6,3.2],center=true);
translate([-3*((eccart_servo-20)/4),-(hauteur+0.2-longueur_vis+epaisseur-1)/2,0])rotate([0,0,90]) square([longueur_vis-epaisseur +1,4],center=true);
translate([-3*((eccart_servo-20)/4),-(hauteur/2-epaisseur-2),0]) square([6.6,3.2],center=true);

hull(){
translate([10,-7,0]) circle(d=8,$fn=60);
translate([-10,-7,0]) circle(d=8,$fn=60);
}

hull(){
translate([(40+eccart_servo/2),-7,0]) circle(d=8,$fn=60);
translate([(20+eccart_servo/2),-7,0]) circle(d=8,$fn=60);
}

hull(){
translate([-(40+eccart_servo/2),-7,0]) circle(d=8,$fn=60);
translate([-(20+eccart_servo/2),-7,0]) circle(d=8,$fn=60);
}

}
}

module plateau(epaisseur,hauteur,largeur,longueur_vis,eccart_servo){
difference(){
square([2*eccart_servo-90,largeur-65],center=true);

for (a =[-1:1]){
translate([a*40,15,0]) circle(d=20,$fn=6);
translate([a*40,-15,0]) circle(d=20,$fn=6);
} 
for (b =[-1.5,-0.5,0.5,1.5]){
translate([b*40,0,0]) circle(d=20,$fn=6);
} 
translate([(eccart_servo-55),20,0]) circle(d=3.9,$fn=40);
translate([-(eccart_servo-55),20,0]) circle(d=3.9,$fn=40);
translate([(eccart_servo-55),-20,0]) circle(d=3.9,$fn=40);
translate([-(eccart_servo-55),-20,0]) circle(d=3.9,$fn=40);
}
}



translate([0,0,0]) bottom(epaisseur,largeur,eccart_servo);
translate([0,largeur+40,0]) top(epaisseur,largeur,eccart_servo);
translate([-40,-(largeur+40),0]) renfort_l(epaisseur,hauteur,largeur,longueur_vis);
translate([40,-(largeur+40),0]) renfort_l(epaisseur,hauteur,largeur,longueur_vis);
translate([0,-4*(hauteur+10),0]) renfort_L(epaisseur,hauteur,largeur,longueur_vis,eccart_servo);
translate([0,-5*(hauteur+15),0]) renfort_L(epaisseur,hauteur,largeur,longueur_vis,eccart_servo);
translate([0,-6*(hauteur+20),0]) plateau(epaisseur,hauteur,largeur,longueur_vis,eccart_servo);


