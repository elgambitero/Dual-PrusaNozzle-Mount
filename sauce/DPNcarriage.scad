include <Primitivas.scad>

clearance=0.1;


//Detalles de las tuercas (probablemente M4). NO TOCAR
nut_gap=6+clearance;
nut_height=3+clearance;

//Detalles de la placa
nozzleplatew=21.4;
nozzleplatel=64;
bolt_separation=50;


//VENTILADORES (COMENTAR LOS QUE NO SEAN)

/*
//Detalles del ventilador 40mm
fan_depth=11.5;
fan_side=40+clearance;
vent_radius=38.40;
fan_bolt_spacing=32+clearance;
*/


//Detalles del ventilador 30mm
fan_depth=6.5;
fan_side=30+clearance;
vent_radius=28.40;
fan_bolt_spacing=24+clearance;

/*
//Detalles del ventilador 35mm
fan_depth=6.5;
fan_side=35+clearance;
vent_radius=28.40+5;
fan_bolt_spacing=29+clearance;
*/



//LM8UU details

LM8UU_Diam=15;
LM8UU_Length=24;
LM8UU_quantity=3;

//Thermal cartridge (Thanks Misan)

thermal_height=10;
thermal_lenght=24;
thermal_width=15;
thermal_hole_l=6+(4.5/2); //these are figured out
thermal_hole_w=6/2;

//Carriage Characteristics

car_width=70;
car_height=40;
top_width=50;
sep_nozzles=21.4;
rosca=4;
sur=3;
nozzle_bolt_depth=30;
nut_depth=15;
nut_reach=18;
walls=2;
//car_lenght=120;
car_lenght=2*sep_nozzles+2*fan_depth+20;

chamber_width=40;


//belt holder characteristics.

holder_height=20;
holder_wall=3;
holder_bolt_sep=8;
holder_plat=12;
holder_rosca=3;
holder_margin=3;
holder_qual=20;
holder_grade=2;


/////////////////////////////////////
//THE CARRIAGE
/////////////////////////////////////

difference(){
	union(){

		//the body
		trapecio(car_lenght,car_width,car_lenght,top_width,car_height);

		//that center block in the body
		roundedprismabox(2*sep_nozzles,car_width,car_height,(rosca/2)+sur);

		//The belt holder
		translate([0,(car_width/2)-2,car_height-holder_height]){
			rotate([0,0,90]){
				belt_holder(holder_height,holder_wall,holder_plat,nut_gap,holder_wall,holder_rosca,holder_bolt_sep,holder_margin,holder_grade,holder_qual);
			}
		}
	}

	//center block drills
	translate([0,0,car_height]){
		centerblock_drills(bolt_separation,sep_nozzles,nozzle_bolt_depth,rosca,nut_depth,nut_gap,nut_reach,nut_height);
	}

	//the nozzleplate window up there...
	translate([0,0,15]){
		roundedprismabox(2*sep_nozzles,chamber_width,car_height+6,4);
	}

	//the actual chamber
	translate([0,0,(car_height/2)-6]){
		rotate([0,90,0]){
			translate([0,0,-(car_lenght-(2*fan_depth)-(2*walls))/2]){
				roundedprismabox(fan_side+12,chamber_width,car_lenght-(2*fan_depth)-(2*walls),4);
			}
		}
	}

	//the fan housing and vent
	translate([0,0,car_height/2]){
		vent(fan_depth,fan_side,fan_bolt_spacing,car_lenght,rosca,20);
	}

	//The LM8UU's housings
	if(LM8UU_quantity==3){
		translate([0,-25,0]){
			rotate([0,90,0]){
				color([0,1,0])
				cylinder(r1=(LM8UU_Diam/2)+clearance,r2=(LM8UU_Diam/2)+clearance,h=LM8UU_Length+clearance,center=true);
				difference(){
					cylinder(r1=walls+(LM8UU_Diam/2)+1.8,r2=walls+(LM8UU_Diam/2)+1.8,h=4,center=true,$fn=round_quality);
					cylinder(r1=walls+(LM8UU_Diam/2),r2=walls+(LM8UU_Diam/2),h=8,center=true,$fn=round_quality);
				}
			}
		}
		for(i=[-1,1]){
			translate([i*((car_lenght/2)-(LM8UU_Length/2)-2*walls),25,0]){
				rotate([0,90,0]){
					color([0,1,0])
					cylinder(r1=(LM8UU_Diam/2)+clearance,r2=(LM8UU_Diam/2)+clearance,h=LM8UU_Length+clearance,center=true);
					difference(){
						cylinder(r1=walls+(LM8UU_Diam/2)+1.8,r2=walls+(LM8UU_Diam/2)+1.8,h=4,center=true,$fn=round_quality);
						cylinder(r1=walls+(LM8UU_Diam/2),r2=walls+(LM8UU_Diam/2),h=8,center=true,$fn=round_quality);
					}
				}
			}
		}
	}
	else{
		for(j=[-1,1]){
			for(i=[-1,1]){
				translate([i*((car_lenght/2)-(LM8UU_Length/2)-2*walls),j*25,0]){
					rotate([0,90,0]){
						color([0,1,0])
						cylinder(r1=(LM8UU_Diam/2)+clearance,r2=(LM8UU_Diam/2)+clearance,h=LM8UU_Length+clearance,center=true);
						difference(){
							cylinder(r1=walls+(LM8UU_Diam/2)+1.8,r2=walls+(LM8UU_Diam/2)+1.8,h=4,center=true,$fn=round_quality);
							cylinder(r1=walls+(LM8UU_Diam/2),r2=walls+(LM8UU_Diam/2),h=8,center=true,$fn=round_quality);
						}
					}
				}
			}
		}
	}

	//rail clearance
	rails(0.5);	
}



/*
///////////////////////////////
//THE NOZZLES
///////////////////////////////

for(i=[-1,1]){
	color([1,0,0])
	translate([i*sep_nozzles/2,0,car_height]){
		prusanozzle(90-i*90,2);
	}
}
*/
/*
//////////////////////////////////
//RAILS
//////////////////////////////////

color([1,1,1])
rails(0);
*/
/*
//////////////////////////////////
//LM8UUs
//////////////////////////////////
if(LM8UU_quantity==3){
	translate([0,-25,0]){
		rotate([0,90,0]){
			color([0,1,0])
			cylinder(r1=LM8UU_Diam/2,r2=LM8UU_Diam/2,h=LM8UU_Length,center=true);
		}
	}
	for(i=[-1,1]){
		translate([i*((car_lenght/2)-(LM8UU_Length/2)-2*walls),25,0]){
			rotate([0,90,0]){
				color([0,1,0])
				cylinder(r1=LM8UU_Diam/2,r2=LM8UU_Diam/2,h=LM8UU_Length,center=true);
			}
		}
	}
}
else{
	for(j=[-1,1]){
		for(i=[-1,1]){
			translate([i*((car_lenght/2)-(LM8UU_Length/2)-2*walls),j*25,0]){
				rotate([0,90,0]){
					color([0,1,0])
					cylinder(r1=LM8UU_Diam/2,r2=LM8UU_Diam/2,h=LM8UU_Length,center=true);
				}
			}
		}
	}
}
*/