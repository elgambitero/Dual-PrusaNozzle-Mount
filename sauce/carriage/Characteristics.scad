clearance=0.4;
switchable_fan=0; //Tells if the fan is removable without screws.

//Detalles de las tuercas (probablemente M3). NO TOCAR
nut_gap=6+clearance;
nut_height=3+clearance;

//Detalles de la placa
nozzleplatew=20;
nozzleplatel=62.5;
bolt_separation=47.50+3;


//VENTILADORES (COMENTAR LOS QUE NO SEAN)

/*
//Detalles del ventilador 40mm
fan_depth=11.5;
fan_side=40+clearance;
vent_radius=38.40;
fan_bolt_spacing=32+clearance;
*/

/*
//Detalles del ventilador 30mm
fan_depth=6.5;
fan_side=30+clearance;
vent_radius=28.40;
fan_bolt_spacing=24+clearance;
*/

//Detalles del ventilador 35mm
fan_depth=10.28+clearance;
fan_side=35+clearance;
vent_radius=28.40+5;
fan_bolt_spacing=29+clearance;


//FEEDER details
feeder_height=8;
bowden_depth=5;
bowden_rosca=9.7;
feeder_ranura=3;
feeder_ranura_sep=5;
buttress_lenght=20;
feeder_grade=2;
feeder_qual=30;


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
car_height=35;
top_width=50;
sep_nozzles=21.4;
rosca=3;
sur=3;
nozzle_bolt_depth=30;
nut_depth=12;
nut_reach=24;
walls=3;
//car_lenght=120;
car_lenght=2*sep_nozzles+2*fan_depth+40;

heatsink_h=16.5;
heatsink_r=8;
lowergap=4;

base_reinforcement=2;

if(switchable_fan!=0){
	assign(car_lenght=2*sep_nozzles+2*fan_depth+20);
}




chamber_width=40;



//belt holder characteristics.

holder_height=25;
holder_wall=3;
holder_center_wall=12;
holder_bolt_sep=10;
holder_plat=17;
holder_rosca=3;
holder_margin=0;
holder_qual=20;
holder_grade=3;

ret_width=1.2;
ret_height=4;

scars=1;
scars_depth=1;

//Cable holder characteristics

ch_width=2;
ch_length=10+2*ch_width;
ch_height=4;
ch_gap=5;
ch_entrance=4;
ch_radius=1.3;
ch_extra=4;
