
include <Primitivas.scad>


mount_bars_sep=58.5;
extruder_bolt_sep=50;

fil_diameter=3.2;

smooth_radius=2;

bowden_height=8.5;
bowden_margin=1;
rosca_bowden=9.7;
rosca_mount=8.2;
rosca_extruder=4.3;
diam_lisa=8.2;

nut_radius=16;
nut_height=6.5;
nut_pos=8;
ext_plate_w=28;
ext_plate_l=77;
ext_plate_h=8;
mount_h=ext_plate_h+bowden_height;
mount_l=78+ext_plate_w;
mount_w=22;

round_qual=20;

plate_deviation=3.5;

difference(){
	union(){
		translate([0,0,-ext_plate_h/2]){
			roundedprismabox(mount_l,mount_w,mount_h,smooth_radius);
		}
		for(i=[-1,1]){
			translate([i*(mount_l/2),plate_deviation,-ext_plate_h/2]){
				roundedprismabox(ext_plate_w,ext_plate_l,ext_plate_h,smooth_radius);
			}
		}
		for(i=[-1,1]){
			translate([i*(mount_l/2),0,ext_plate_h/2]){
				cylinder(r1=ext_plate_w/2,r2=(rosca_bowden/2)+bowden_margin,h=bowden_height,$fn=round_qual);
			}
		}
	}
	for(i=[-1,1]){
		for(j=[-1,1]){
			translate([i*mount_l/2,j*extruder_bolt_sep/2,0]){
				cylinder(r1=rosca_extruder/2,r2=rosca_extruder/2,h=100,center=true,$fn=round_qual);
			}
		}
	}
	translate([0,mount_w/2,0]){
		cylinder(r1=diam_lisa/2,r2=diam_lisa/2,h=100,center=true,$fn=round_qual);
	}
	for(i=[-1,1]){
		translate([i*mount_bars_sep/2,0,(mount_h-ext_plate_h)/2]){
			rotate([90,0,0]){
				cylinder(r1=rosca_mount/2,r2=rosca_mount/2,h=100,center=true,$fn=round_qual);
			}
		}
	}
	for(i=[-1,1]){
		translate([i*mount_bars_sep/2,-nut_pos+(mount_w/2),(mount_h-ext_plate_h)/2]){
			cube([nut_radius,nut_height,100],center=true);
		}
	}
	for(i=[-1,1]){
		translate([i*mount_l/2,0,0]){
			cylinder(r1=fil_diameter/2,r2=fil_diameter/2,h=100,center=true,$fn=round_qual);
		}
	}
	for(i=[-1,1]){
		translate([i*mount_l/2,0,(ext_plate_h+bowden_height)/2]){
			cylinder(r1=rosca_bowden/2,r2=rosca_bowden/2,h=bowden_height,center=true,$fn=round_qual);
		}
	}
}