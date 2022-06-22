// OpenSCAD Fully parametric drawer cable storage management hex hive with punch cuts
// Originally by iX (November 02, 2016)
// Extended by mofosyne for punchcut support (February 20, 2022)
//
// This is an extension of iX's fully parametric OpenSCAD script but extended to add side cuts to reduce material usage.
// This OpenSCAD sketch to generate fully customizable honeycomb wire storage system.
//
// Remix Of:
//  - Fully parametric drawer cable storage management hive by iX__ November 02, 2016 : https://www.thingiverse.com/thing:1862897
//  - Cable Management Hive Remix by murlr August 24, 2016 : https://www.thingiverse.com/thing:1734587
//  - Cable management Hive by Filar3D August 09, 2015 : https://www.thingiverse.com/thing:961176
//
// To Contribute:
//  - Send any improvements as a pull request to https://github.com/mofosyne/openscad-hex-cable-hive-fully-parametric
//

// custom cable hive
$fn = 6; // hex=6

/////////////////////////////////////////////////////////////////////////////////
//////////////////////////// Public variables /////////////////////////////////
/////////////////////// Update it to fit your needs /////////////////////////
/////////////////////////////////////////////////////////////////////////////////

/* [Number Of Slots] */
nb_slots_X = 4; // Sets the number of honeycomb slot in X direction
nb_slots_Y = 5; // Sets the number of honeycomb slots in Y it's better to have nb_slots_Y a odd number if you wish to add a surrounding wall

/* [Cable Slot] */
cable_slot_height = 120;  // depth of the slots
cable_slot_lower_height = cable_slot_height;  // depth of the slots for sloping
cable_slot_diameter = 42; // diameter of the slots

/* [3D Printer] */
nozzle = 0.4;
nb_of_outer_shell = 3;
margin_to_have_correct_number_of_lines = 0.01;

/* [Side Wall Punch Related Options] */
punch_corner_hole_count = 4;
punch_corner_w = 8;
punch_corner_h = 4;

/* [Mounting Screw Hole Related Option] */
drillholeDiameter=8;
countersunkDiameter=15;
countersunkHeight=2;

/* [Length Wise Cut] */
lengthwise_cuts_count = 3;

/* [Build Options] */
I_want_a_surrounding_wall = false; // set this bit to 1 if you wannt a square wall surronding your cable hive. It is better to set option "I_wish_to_combine_it_later" to 0 to have nice surrounding wall

I_wish_to_combine_it_later = false; // will add a slot on all odd Y lines so that you will be able to concatenate this part with an other on

I_want_side_wall_punch = true; // set this bit to 1 to reduce material requirement

I_want_mounting_screw_holes = false; // set this bit to 1 to add mounting holes

I_want_lengthwise_cuts = false; // set this bit to 1 to add extra internal cuts (e.g. business cards)

/////////////////////////////////////////////////////////////////////////////////
//////////////////////////// Private Variables ////////////////////////////////
////////////// You shouldn't have to touch these ones ////////////////////
/////////////////////////////////////////////////////////////////////////////////

cable_slot_wall_thickness = (nozzle + margin_to_have_correct_number_of_lines) * nb_of_outer_shell; // Chose a width which is a multiple of your nozzle diameter

Internal_honeycomb_diameter = cable_slot_diameter - ((2 * cable_slot_wall_thickness) / cos(30));

Honeycomb_external_X_size = cable_slot_diameter * cos(30);
Honeycomb_external_Y_size = cable_slot_diameter;

Honeycomb_internal_X_size = Internal_honeycomb_diameter * cos(30);
Honeycomb_internal_Y_size = Internal_honeycomb_diameter;

Real_wall_width_X = (cable_slot_diameter / 2) * cos(30) - (Internal_honeycomb_diameter / 2) * cos(30);
Real_wall_width_Y = Honeycomb_external_Y_size / 2 - Honeycomb_internal_Y_size / 2;

pitch_X_bis = Honeycomb_internal_X_size + ((Real_wall_width_X));
pitch_Y_bis = (((Honeycomb_external_Y_size / 2) - Real_wall_width_Y / 2) * (1 + sin(30))); // - (Real_wall_width_Y);

// pitch_X = (cable_slot_diameter-(cable_slot_wall_thickness/2))*cos(30);
// pitch_Y = (cable_slot_diameter/2*(1+sin(30)))-cable_slot_wall_thickness/2;

pitch_X = pitch_X_bis;
pitch_Y = pitch_Y_bis;

echo("External honeycomb diameter is", cable_slot_diameter);
echo("Internal honeycomb diameter is", Internal_honeycomb_diameter);

echo("Requested wall width is", cable_slot_wall_thickness);
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

difference()
{
    // Main Bulk
    for (X = [0:(nb_slots_X - 1)])
    {
        for (Y = [0:(nb_slots_Y - 1)])
        {
            slotH = (cable_slot_height - cable_slot_lower_height)*((Y%nb_slots_Y) / nb_slots_Y) + cable_slot_lower_height;
            if (Y % 2 == 0)
            {
                translate([ X * pitch_X, Y * pitch_Y, 0 ]) honeycomb(slotH);
            }
            else if (X != nb_slots_X - 1 || I_wish_to_combine_it_later != 0)
            {
                translate([ (X + 0.5) * pitch_X, Y * pitch_Y, 0 ]) honeycomb(slotH);
            }
        }
    }

    // Extra Side Wall Cuts (e.g. Business Cards)
    if (I_want_lengthwise_cuts)
    {
        for (X = [0:(nb_slots_X - 1)])
        {
            for (Y = [0:(nb_slots_Y - 1)])
            {
                if ((X != 0) && ((X % lengthwise_cuts_count) > 0))
                {
                    if (Y % 2 == 0)
                    {
                        translate([ X * pitch_X, Y * pitch_Y, 0 ]) honeycomb_side_wall_cut();
                    }
                    else if (X != nb_slots_X - 1 || I_wish_to_combine_it_later != 0)
                    {
                        translate([ (X + 0.5) * pitch_X, Y * pitch_Y, 0 ]) honeycomb_side_wall_cut();
                    }
                }
            }
        }
    }
}


if (I_want_a_surrounding_wall)
{
    surrounding_square();
}

if (I_wish_to_combine_it_later == 0)
{
    Full_X_dim = (nb_slots_X) * (cable_slot_diameter * cos(30)) - (nb_slots_X - 1.5) * (cable_slot_wall_thickness / 2);
    Full_Y_dim = (nb_slots_Y * pitch_Y) + (cable_slot_diameter / 2 * (1 - sin(30))) + (0.5 * cable_slot_wall_thickness);
    echo("This is wonderfull cable hive you made there :)");
    echo("Its dimensions are X = ", Full_X_dim, " and Y =", Full_Y_dim);
    echo(" You have a total number of  ", nb_slots_X * nb_slots_Y, " slots to host your silly cables :)");
}
else
{
    Full_X_dim = (nb_slots_X + 0.5) * (cable_slot_diameter * cos(30)) - (nb_slots_X - 1) * (cable_slot_wall_thickness / 2);
    Full_Y_dim = (nb_slots_Y * pitch_Y) + (cable_slot_diameter / 2 * (1 - sin(30))) + (0.5 * cable_slot_wall_thickness);
    echo("This is wonderfull cable hive you made there :)");
    echo("Its dimensions are X = ", Full_X_dim, " and Y =", Full_Y_dim);
    echo(" You have a total number of  ", nb_slots_X * nb_slots_Y, " slots to host your silly cables :)");
};

/////////////////////////////////////////////////////////////////////////////////
//////////////////////////// Modules //////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

module honeycomb(cable_slot_height)
{
    //#cylinder(d=cable_slot_diameter,h=cable_slot_height,$fn=64);
    rotate([ 0, 0, 30 ]) difference()
    {
        // Outer Volume
        cylinder(d = cable_slot_diameter, h = cable_slot_height);

        // Inner Volume
        translate([ 0, 0, cable_slot_wall_thickness ]) cylinder(d = Internal_honeycomb_diameter, h = cable_slot_height);

        // Reduce Material Usage And Print Time By Adding Cuts To Side Walls
        if (I_want_side_wall_punch)
        {
            punch_cut_total_h = (cable_slot_height - cable_slot_wall_thickness * 2);
            punch_cut_corner_h = punch_cut_total_h / punch_corner_hole_count;
            max_height_cuts = punch_cut_total_h / punch_cut_corner_h;
            punch_cut_side_angle = 360 / $fn;
            punch_cut_W = 2 * (sin(punch_cut_side_angle / 2) * (cable_slot_diameter / 2));
            punch_cut_Apothem = cos(punch_cut_side_angle / 2) * (cable_slot_diameter / 2);
            for (cutZ = [0:(max_height_cuts - 1)])
            {
                max_rotate_cut = 360 / punch_cut_side_angle;
                punch_cut_Z = cable_slot_wall_thickness + punch_cut_corner_h / 2 + cutZ * (punch_cut_total_h / max_height_cuts);
                translate([ 0, 0, punch_cut_Z ])
                {
                    for (cutRotate = [0:(max_rotate_cut - 1)])
                    {
                        rotate([ 0, 0, (punch_cut_side_angle / 2) + cutRotate * punch_cut_side_angle ])
                            translate([ punch_cut_Apothem - cable_slot_wall_thickness / 2, 0, 0 ])
                                cube([ cable_slot_wall_thickness * 2, punch_cut_W - punch_corner_w, punch_cut_corner_h - punch_corner_h ], center = true);
                    }
                }
            }
        }

        // Add mounting screw holes
        if (I_want_mounting_screw_holes)
        {
            drillHole();
        }
    }
};

module surrounding_square()
{
    if (I_wish_to_combine_it_later == 0)
    {
        Full_X_dim = (nb_slots_X) * (cable_slot_diameter * cos(30)) - (nb_slots_X - 1.5) * (cable_slot_wall_thickness / 2);
        Full_Y_dim = (nb_slots_Y * pitch_Y) + (cable_slot_diameter / 2 * (1 - sin(30))) + (0.5 * cable_slot_wall_thickness);

        translate([ -pitch_X / 2 - cable_slot_wall_thickness / 2, -cable_slot_diameter / 2, 0 ])
            difference()
        {
            cube([ Full_X_dim, Full_Y_dim, cable_slot_height ]);
            translate([ cable_slot_wall_thickness, cable_slot_wall_thickness, cable_slot_wall_thickness ]) cube([ Full_X_dim - 2 * cable_slot_wall_thickness, Full_Y_dim - 2 * cable_slot_wall_thickness, cable_slot_height ]);
        }
    }
    else
    {
        Full_X_dim = (nb_slots_X + 0.5) * (cable_slot_diameter * cos(30)) - (nb_slots_X - 1.5) * (cable_slot_wall_thickness / 2);
        Full_Y_dim = (nb_slots_Y * pitch_Y) + (cable_slot_diameter / 2 * (1 - sin(30))) + (0.5 * cable_slot_wall_thickness);

        translate([ -pitch_X / 2 - cable_slot_wall_thickness / 2, -cable_slot_diameter / 2, 0 ])
            difference()
        {
            cube([ Full_X_dim, Full_Y_dim, cable_slot_height ]);
            translate([ cable_slot_wall_thickness, cable_slot_wall_thickness, cable_slot_wall_thickness ]) cube([ Full_X_dim - 2 * cable_slot_wall_thickness, Full_Y_dim - 2 * cable_slot_wall_thickness, cable_slot_height ]);
        };
    };
};

module drillHole()
{
    backplateThickness = cable_slot_wall_thickness;
    fn = 30;
    if (countersunkHeight > cable_slot_wall_thickness)
    {
        // Not thick enough for countersink. Just make a simple hole
        translate([0,-backplateThickness-0.001,0])
            rotate([0,0,0])
                translate([0,0,-0.01]) cylinder(r=drillholeDiameter/2,h=(backplateThickness+0.02),$fn=fn);
    }
    else
    {
        // Large enough for countersink hollowingd
        translate([0,-backplateThickness-0.001,0])
            rotate([0,0,0])
            {
                translate([0,0,-0.01]) cylinder(r=drillholeDiameter/2,h=backplateThickness,$fn=fn);
                translate([0,0,backplateThickness-countersunkHeight+0.001]) cylinder(r1=drillholeDiameter/2,r2=countersunkDiameter/2,h=countersunkHeight+0.02,$fn=fn);
            }
    }
}


module honeycomb_side_wall_cut()
{
    // Add Extended Cut (e.g. Business Cards)
    rotate([ 0, 0, 30 ])
    {
        // Add Extended Cut (e.g. Business Cards)
        less_side_wall_total_h = (cable_slot_height - cable_slot_wall_thickness * 2);
        less_side_wall_corner_h = less_side_wall_total_h / punch_corner_hole_count;
        less_side_wall_side_angle = 360 / $fn;
        less_side_wall_W = 2 * (sin(less_side_wall_side_angle / 2) * (cable_slot_diameter / 2));
        less_side_wall_Apothem = cos(less_side_wall_side_angle / 2) * (cable_slot_diameter / 2);
        for (cutRotate = [2:2])
        {
            translate([ 0, 0, cable_slot_wall_thickness + cable_slot_height / 2 ])
                rotate([ 0, 0, (less_side_wall_side_angle / 2) + cutRotate * less_side_wall_side_angle ])
                    translate([ less_side_wall_Apothem - cable_slot_wall_thickness / 2, 0, 0 ])
                        cube([ cable_slot_wall_thickness * 2, less_side_wall_W - cable_slot_wall_thickness, cable_slot_height], center = true);
        }
    }
};