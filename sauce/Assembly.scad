switchable_fan=1; //Tells if the fan is removable without screws.

include <Primitivas.scad>
include <DPNcarriage.scad>

module assembled(){
	LM8UUs();
	nozzles();
	carriage();
	color([1,1,1]);
	rails(0);
	
	for(i=[-1,1]){
		translate([i*sep_nozzles/2,0,car_height]){
			rotate([0,0,90]){
				feeder();
			}
		}	
	}
}

//vent(fan_depth,fan_side,fan_bolt_spacing,car_lenght,rosca,20);

assembled();