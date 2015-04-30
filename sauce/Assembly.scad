

include <Primitivas.scad>
include <DPNcarriage.scad>

module assembled(){
	LM8UUs();
	nozzles();
	carriage();
	color([1,1,1]);
	rails(0);
	
	for(i=[-1,1]){
		translate([i*sep_nozzles/2,0,car_height+4]){
			rotate([0,0,90]){
				feeder();
			}
		}	
	}
	for(i=[-1,1]){
		translate([i*(holder_center_wall+nut_gap)/2,(car_width+holder_plat)/2,car_height-holder_height]){
			rotate([0,180,90]){
				retainer(rosca,holder_bolt_sep,ret_width,ret_height,ch_extra);
			}
		}
	}
}



assembled();


//carriage();

//retainer(rosca,holder_bolt_sep,ret_width,ret_height);

//feeder();