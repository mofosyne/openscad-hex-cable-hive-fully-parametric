// custom cable hive
$fn=6;
/////////////////////////////////////////////////////////////////////////////////
//////////////////////////// Public variables /////////////////////////////////
/////////////////////// Update it to fit your needs /////////////////////////
/////////////////////////////////////////////////////////////////////////////////
nb_slots_X = 4; // Sets the number of honeycomb slot in X direction 
nb_slots_Y = 5; // Sets the number of honeycomb slots in Y it's better to have nb_slots_Y a odd number if you wish to add a surrounding wall

cable_slot_heigth = 120; // depth of the slots
cable_slot_diameter = 42; // diameter of the slots

nozzle = 0.4;
nb_of_outer_shell = 3;
margin_to_have_correct_number_of_lines = 0.01;

cable_slot_wall_thickness = (nozzle+margin_to_have_correct_number_of_lines)*nb_of_outer_shell; //Chose a width which is a multiple of your noozle diameter

I_want_a_surronding_wall = 0; //set this bit to 1 if you wannt a square wall surronding your cable hive. It is better to set option "I_wish_to_combine_it_later" to 0 to have nice surrounding wall

I_wish_to_combine_it_later = 0; //will add a slot on all odd Y lines so that you will be able to concatenate this part with an other on

/////////////////////////////////////////////////////////////////////////////////
//////////////////////////// Private Variables ////////////////////////////////
////////////// You shoudn't have to touch these ones ////////////////////
/////////////////////////////////////////////////////////////////////////////////

Internal_honeycomb_diameter = cable_slot_diameter - ((2*cable_slot_wall_thickness)/cos(30));

Honeycomb_external_X_size = cable_slot_diameter*cos(30);
Honeycomb_external_Y_size = cable_slot_diameter;

Honeycomb_internal_X_size = Internal_honeycomb_diameter*cos(30);
Honeycomb_internal_Y_size = Internal_honeycomb_diameter;

Real_wall_width_X = (cable_slot_diameter/2)*cos(30) - (Internal_honeycomb_diameter/2)*cos(30);
Real_wall_width_Y = Honeycomb_external_Y_size/2 - Honeycomb_internal_Y_size/2;

pitch_X_bis = Honeycomb_internal_X_size + ((Real_wall_width_X));
pitch_Y_bis = (((Honeycomb_external_Y_size/2)-Real_wall_width_Y/2)*(1+sin(30)));// - (Real_wall_width_Y);

//pitch_X = (cable_slot_diameter-(cable_slot_wall_thickness/2))*cos(30);
//pitch_Y = (cable_slot_diameter/2*(1+sin(30)))-cable_slot_wall_thickness/2;

pitch_X = pitch_X_bis;
pitch_Y = pitch_Y_bis;

echo("External honeycomb diameter is", cable_slot_diameter);
echo("Internal honeycomb diameter is", Internal_honeycomb_diameter);

echo("Requested wall width is",cable_slot_wall_thickness);
echo("The real wall width in X is", Real_wall_width_X);
echo("The real wall width in Y is", Real_wall_width_Y);

echo("External honeycomb X size is ", Honeycomb_external_X_size);
echo("External honeycomb Y size is", Honeycomb_external_Y_size);

echo("Internal honeycomb X size is ", Honeycomb_internal_X_size);
echo("Internal honeycomb Y size is", Honeycomb_internal_Y_size);

echo("Pitch in X is", pitch_X);
echo("Pitch bis in X is", pitch_X_bis);

echo("Pitch in Y is", pitch_Y);
echo("Pitch bis in Y is", pitch_Y_bis);

/////////////////////////////////////////////////////////////////////////////////
//////////////////////////// Core //////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

for( X = [0 : (nb_slots_X-1)] ){
	for( Y = [0 : (nb_slots_Y-1)] ){
		if(Y%2 == 0){
			translate([X*pitch_X, Y*pitch_Y, 0]) honeycomb();
		}
		else if (X != nb_slots_X-1 || I_wish_to_combine_it_later != 0){
			translate([(X+0.5)*pitch_X, Y*pitch_Y, 0]) honeycomb();
		}
	}
}

if(I_want_a_surronding_wall) surrounding_square();

if(I_wish_to_combine_it_later == 0){
	Full_X_dim = (nb_slots_X) * (cable_slot_diameter*cos(30)) - (nb_slots_X-1.5) * (cable_slot_wall_thickness/2);
	Full_Y_dim = (nb_slots_Y*pitch_Y) + (cable_slot_diameter/2 * (1-sin(30))) + (0.5*cable_slot_wall_thickness);
	echo("This is wonderfull cable hive you made there :)");
	echo("Its dimensions are X = ", Full_X_dim, " and Y =", Full_Y_dim);
	echo(" You have a total number of  ", nb_slots_X*nb_slots_Y, " slots to host your silly cables :)");
}
else {
	Full_X_dim = (nb_slots_X+0.5) * (cable_slot_diameter*cos(30)) - (nb_slots_X-1) * (cable_slot_wall_thickness/2);
	Full_Y_dim = (nb_slots_Y*pitch_Y) + (cable_slot_diameter/2 * (1-sin(30))) + (0.5*cable_slot_wall_thickness);
	echo("This is wonderfull cable hive you made there :)");
	echo("Its dimensions are X = ", Full_X_dim, " and Y =", Full_Y_dim);
	echo(" You have a total number of  ", nb_slots_X*nb_slots_Y, " slots to host your silly cables :)");
};


/////////////////////////////////////////////////////////////////////////////////
//////////////////////////// Modules //////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
module honeycomb(){
	//#cylinder(d=cable_slot_diameter,h=cable_slot_heigth,$fn=64);
	rotate([0,0,30]) difference(){
		cylinder(d=cable_slot_diameter,h=cable_slot_heigth);
		translate([0, 0, cable_slot_wall_thickness])cylinder(d=Internal_honeycomb_diameter,h=cable_slot_heigth);
	}
};

module surrounding_square(){
	
	if(I_wish_to_combine_it_later == 0){
		Full_X_dim = (nb_slots_X) * (cable_slot_diameter*cos(30)) - (nb_slots_X-1.5) * (cable_slot_wall_thickness/2);
		Full_Y_dim = (nb_slots_Y*pitch_Y) + (cable_slot_diameter/2 * (1-sin(30))) + (0.5*cable_slot_wall_thickness);
	
		translate([-pitch_X/2 - cable_slot_wall_thickness/2, -cable_slot_diameter/2, 0])
		difference(){
			cube([Full_X_dim, Full_Y_dim, cable_slot_heigth]);
			translate([cable_slot_wall_thickness, cable_slot_wall_thickness, cable_slot_wall_thickness]) cube([Full_X_dim-2*cable_slot_wall_thickness, Full_Y_dim-2*cable_slot_wall_thickness, cable_slot_heigth]);
		}
	}
	else{
		Full_X_dim = (nb_slots_X+0.5) * (cable_slot_diameter*cos(30)) - (nb_slots_X-1.5) * (cable_slot_wall_thickness/2);
		Full_Y_dim = (nb_slots_Y*pitch_Y) + (cable_slot_diameter/2 * (1-sin(30))) + (0.5*cable_slot_wall_thickness);
	
		translate([-pitch_X/2 - cable_slot_wall_thickness/2, -cable_slot_diameter/2, 0])
		difference(){
			cube([Full_X_dim, Full_Y_dim, cable_slot_heigth]);
			translate([cable_slot_wall_thickness, cable_slot_wall_thickness, cable_slot_wall_thickness]) cube([Full_X_dim-2*cable_slot_wall_thickness, Full_Y_dim-2*cable_slot_wall_thickness, cable_slot_heigth]);
		};
	};
};














