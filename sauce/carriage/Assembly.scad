

include <Primitivas.scad>
include <DPNcarriage.scad>

round_qual=30;

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
/*
	for(i=[-1,1]){
		translate([i*(car_lenght-fan_depth)/2,0,car_height-(fan_side/2)-3]){
			cube([fan_depth,fan_side,fan_side],center=true);
		}
	}
*/
	for(i=[-1,1]){
		translate([i*sep_nozzles/2,0,car_height-27.6+(16.35/2)]){
			cylinder(r1=8,r2=8,h=16.35,$fn=round_qual,center=true);
		}
	}
	
}



//assembled();

//vent2(fan_depth,fan_side,fan_bolt_spacing,car_lenght,rosca,20,switchable_fan);

//canalizer(car_lenght-(2*fan_depth)-(2*walls)-1,fan_side-1,fan_side-8,40,20,28,3,fan_bolt_spacing,3);



carriage();

//retainer(rosca,holder_bolt_sep,ret_width,ret_height,ch_extra);

//feeder(0.5);

//vent3(fan_depth,fan_side,fan_bolt_spacing,car_lenght,rosca,20,switchable_fan);