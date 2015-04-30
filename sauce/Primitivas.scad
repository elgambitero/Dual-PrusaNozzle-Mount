round_quality=30;


module trapecio(a,b,c,d,e){
	polyhedron(points=[[a/2,b/2,0],[a/2,-b/2,0],[-a/2,-b/2,0],[-a/2,b/2,0],[c/2,d/2,e],[c/2,-d/2,e],[-c/2,-d/2,e],[-c/2,d/2,e]],
			triangles=[[1,4,5],[0,4,1],[0,7,4],[0,3,7],[3,6,7],[3,2,6],[5,6,2],[2,1,5],[5,4,7],[5,7,6],[0,1,2],[0,2,3]]
	);
}

//too complicated... about to be removed
module centerblock(dd,dw,h,d,sur){
	union(){
		translate([dd/2,dw/2,h/2]){
			cylinder(r1=((d/2)+sur),r2=((d/2)+sur),h=h,center=true,$fn=round_quality);
		}
		translate([dd/2,-dw/2,h/2]){
			cylinder(r1=((d/2)+sur),r2=((d/2)+sur),h=h,center=true,$fn=round_quality);
		}
		translate([-dd/2,-dw/2,h/2]){
			cylinder(r1=((d/2)+sur),r2=((d/2)+sur),h=h,center=true,$fn=round_quality);
		}
		translate([-dd/2,dw/2,h/2]){
			cylinder(r1=((d/2)+sur),r2=((d/2)+sur),h=h,center=true,$fn=round_quality);
		}
		translate([0,0,h/2]){
			cube([dd+d+2*sur,dw,h],center=true);
		}
		translate([0,0,h/2]){
			cube([dd,dw+d+2*sur,h],center=true);
		}
	}		
}


module centerblock_drills(dw,dd,depth,d,nut_depth,nut_gap,nut_reach,nut_height){
	union(){
		translate([dd/2,dw/2,-depth/2]){
			cylinder(r1=d/2,r2=d/2,h=depth+1,center=true,$fn=round_quality);
		}
		translate([dd/2,(dw/2-(nut_reach/2-(nut_gap/2))),-(nut_depth)]){
			cube([nut_gap,nut_reach,nut_height],center=true);
		}
	}
	union(){
		translate([dd/2,-dw/2,-depth/2]){
			cylinder(r1=d/2,r2=d/2,h=depth+1,center=true,$fn=round_quality);
		}
		translate([dd/2,-(dw/2-(nut_reach/2-(nut_gap/2))),-(nut_depth)]){
			cube([nut_gap,nut_reach,nut_height],center=true);
		}
	}
	union(){
		translate([-dd/2,-dw/2,-depth/2]){
			cylinder(r1=d/2,r2=d/2,h=depth+1,center=true,$fn=round_quality);
		}
		translate([-dd/2,-(dw/2-(nut_reach/2-(nut_gap/2))),-(nut_depth)]){
			cube([nut_gap,nut_reach,nut_height],center=true);
		}
	}
	union(){
		translate([-dd/2,dw/2,-depth/2]){
			cylinder(r1=d/2,r2=d/2,h=depth+1,center=true,$fn=round_quality);
		}
		translate([-dd/2,(dw/2-(nut_reach/2-(nut_gap/2))),-(nut_depth)]){
			cube([nut_gap,nut_reach,nut_height],center=true);
		}
	}
	

}


module roundedprismabox(l,w,h,r){
	union(){
		translate([((l/2)-r),((w/2)-r),h/2]){
			cylinder(r1=r,r2=r,h=h,center=true,$fn=round_quality);
		}
		translate([((l/2)-r),-((w/2)-r),h/2]){
			cylinder(r1=r,r2=r,h=h,center=true,$fn=round_quality);
		}
		translate([-((l/2)-r),-((w/2)-r),h/2]){
			cylinder(r1=r,r2=r,h=h,center=true,$fn=round_quality);
		}
		translate([-((l/2)-r),((w/2)-r),h/2]){
			cylinder(r1=r,r2=r,h=h,center=true,$fn=round_quality);
		}
		translate([0,0,h/2]){
			cube([l-2*r,w,h],center=true);
		}
		translate([0,0,h/2]){
			cube([l,w-2*r,h],center=true);
		}
	}
}

module rails(clearance){
	for(i=[-1,1]){
		translate([0,(4+21)*i,0]){
			rotate([0,90,0]){
				cylinder(r1=4+clearance,r2=4+clearance,h=1200,center=true);
			}
		}
	}
}

module vent(fan_depth,fan_side,bolt_spacing,total_lenght,rosca,rosca_lenght){
	union(){
		for(i=[-1,1]){
			translate([i*((total_lenght/2)-(fan_depth/2)),0,0]){
				cube([fan_depth+1,fan_side,fan_side],center=true);
			}
		}
		for(i=[-1,1]){
			translate([i*((total_lenght/2)-(fan_depth/2)-(rosca_lenght/2)),0,0]){
				rotate([0,90,0]){
					for(i=[0,1,2,3]){
						rotate([0,0,90*i]){
							translate([bolt_spacing/2,bolt_spacing/2,0]){
								cylinder(r1=rosca/2,r2=rosca/2,h=rosca_lenght,$fn=round_quality,center=true);
							}
						}
					}
				}
			}
		}
		rotate([360/16,0,0]){
			rotate([0,90,0]){
				cylinder(r1=(((fan_side/(1+sqrt(2)))/2)/sin(360/16)),r2=(((fan_side/(1+sqrt(2)))/2)/sin(360/16)),h=total_lenght+2,$fn=8,center=true);
			}
		}
	}
}


module buttress_piece(a,b,c,d,e){
	polyhedron(points=[[a/2,b/2,0],[a/2,-b/2,0],[-a/2,-b/2,0],[-a/2,b/2,0],[(c)-(a/2),d/2,e],[(c)-(a/2),-d/2,e],[-a/2,-d/2,e],[-a/2,d/2,e]],
			triangles=[[1,4,5],[0,4,1],[0,7,4],[0,3,7],[3,6,7],[3,2,6],[5,6,2],[2,1,5],[5,4,7],[5,7,6],[0,1,2],[0,2,3]]
	);
}




module grade_buttress(base1,base2,width,height,grade,iterations){
	union(){
		for(i=[0:iterations-1]){
			translate([(base1-(base1-base2)*pow((i/iterations),grade))/2,0,i*height/iterations]){
				buttress_piece(base1-(base1-base2)*pow((i/iterations),grade),width,base1-(base1-base2)*pow(((i+1)/iterations),grade),width,height/iterations);
			}
		}
	}
}



module belt_holder(height,width,depth,gap,base,rosca,bolt_sep,margin,grade,quality){
	difference(){
		union(){
			for(i=[-1:1]){
				translate([0,i*(gap+width),height]){
					rotate([180,0,0]){
						grade_buttress(2,depth+2+margin,width,height-(base),grade,quality);
					}
				}
			}
			translate([(margin+depth+2)/2,0,base/2]){
				cube([margin+depth+2,(2*gap)+(3*width),base],center=true);
			}
		}
		for(i=[-1,1]){
			for(j=[-1,1]){
				translate([((margin)+2+(depth/2))+i*(bolt_sep/2),j*((width+gap)/2),base/2]){
					cube([rosca,gap,base+2],center=true);
				}
			}
		}
	}
}


//belt_holder(15,4,10,3,4,4,8,3,2,10);





///////////////////////////////////
//NOZZLE DUMMIES
///////////////////////////////////


module cartridge(){
	//difference(){
		translate([-(6+(4.5/2)),-6/2,0]){
			cube([24,15,10]);
		}
		/*
		translate([0,0,6]){
			cylinder(r1=4.5/2,r2=4.5/2,h=14,center=true);
		}
		*/
	//}
}

module prusanozzle(angle,height){
	union(){
		translate([0,0,2]){
			cube([21.4,64,4],center=true);
		}
		translate([0,0,-((52.86/2)-4)]){
			cylinder(r1=4.5/2,r2=4.5/2,h=52.86,center=true);
		}
		rotate([0,0,angle]){
			translate([0,0,-52.86+height+4]){
				cartridge();
			}
		}
	}
}









/////////////////////////////
//TESTS
/////////////////////////////




//prusanozzle(90,2);




//cartridge();


//grade_buttress(3,10,20,20,2,20);

//buttress_piece(40,20,40,20,20);

//vent(11.5,40,32,120,4,20);

//centerblock_drills(30,40,30,4,20,6,18,3);
//roundedprismabox(30,40,50,4);
//cube([30,40,20],center=true);
