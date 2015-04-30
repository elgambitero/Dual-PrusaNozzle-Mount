

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
	for(i=[-1,1]){
		translate([i*(car_lenght-fan_depth)/2,0,car_height-(fan_side/2)-3]){
			cube([fan_depth,fan_side,fan_side],center=true);
		}
	}
}



//assembled();

//vent2(fan_depth,fan_side,fan_bolt_spacing,car_lenght,rosca,20,switchable_fan);


//carriage();

retainer(rosca,holder_bolt_sep,ret_width,ret_height,ch_extra);

//feeder();