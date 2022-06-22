MKDIR_P = mkdir -p
MODELFILE=cable_hive.scad

all: imageRender punch_cut solid_wall boxed_wall punch_cut_with_screwmount solid_wall_with_screwmount hive_for_mk3s_plus_buildplate business_card_holders

imageRender:
# Cable Hives (Square)
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_punch_cut_1x1.png ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_punch_cut_2x2.png ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_punch_cut_3x3.png ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_punch_cut_4x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D lengthwise_cuts_count=2 -o ./png/cable_hive_double_sized_2x2.png ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D lengthwise_cuts_count=2 -o ./png/cable_hive_double_sized_3x3.png ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D lengthwise_cuts_count=2 -o ./png/cable_hive_double_sized_4x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_solid_wall_1x1.png ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_solid_wall_2x2.png ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_solid_wall_3x3.png ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_solid_wall_4x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./png/cable_hive_boxed_wall_1x1.png ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./png/cable_hive_boxed_wall_2x2.png ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./png/cable_hive_boxed_wall_3x3.png ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./png/cable_hive_boxed_wall_4x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./png/cable_hive_punch_cut_with_screwmount_1x1.png ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./png/cable_hive_punch_cut_with_screwmount_2x2.png ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./png/cable_hive_punch_cut_with_screwmount_3x3.png ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./png/cable_hive_punch_cut_with_screwmount_4x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./png/cable_hive_solid_wall_with_screwmount_1x1.png ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./png/cable_hive_solid_wall_with_screwmount_2x2.png ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./png/cable_hive_solid_wall_with_screwmount_3x3.png ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./png/cable_hive_solid_wall_with_screwmount_4x5.png ${MODELFILE}
# Fits Prusa MK3S+ build plate (MK3S+ build volume is 25×21×21 cm)
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_punch_cut_6x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D lengthwise_cuts_count=2 -o ./png/cable_hive_double_sized_6x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_solid_wall_6x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./png/cable_hive_boxed_wall_6x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./png/cable_hive_solid_wall_with_screwmount_6x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=6 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_punch_cut_6x6.png ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=6 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D lengthwise_cuts_count=2 -o ./png/cable_hive_double_sized_6x6.png ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=6 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_solid_wall_6x6.png ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=6 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./png/cable_hive_boxed_wall_6x6.png ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=6 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./png/cable_hive_solid_wall_with_screwmount_6x6.png ${MODELFILE}
# Business Card Hive (Fits within maximum volume of MK3S+, where it's build volume is 25×21×21 cm)
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D cable_slot_lower_height=10 -o ./png/businesscard_hive_6x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D I_want_smooth_slope_cuts=true -D cable_slot_lower_height=10 -o ./png/businesscard_hive_slope_6x5.png ${MODELFILE}

punch_cut:
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_punch_cut_1x1.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_punch_cut_2x2.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_punch_cut_3x3.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_punch_cut_4x5.stl ${MODELFILE}

double_sized:
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D lengthwise_cuts_count=2 -o ./stl/cable_hive_double_sized_2x2.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D lengthwise_cuts_count=2 -o ./stl/cable_hive_double_sized_3x3.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D lengthwise_cuts_count=2 -o ./stl/cable_hive_double_sized_4x5.stl ${MODELFILE}

solid_wall:
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_solid_wall_1x1.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_solid_wall_2x2.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_solid_wall_3x3.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_solid_wall_4x5.stl ${MODELFILE}

boxed_wall:
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_boxed_wall_1x1.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_boxed_wall_2x2.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_boxed_wall_3x3.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_boxed_wall_4x5.stl ${MODELFILE}

punch_cut_with_screwmount:
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./stl/cable_hive_punch_cut_with_screwmount_1x1.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./stl/cable_hive_punch_cut_with_screwmount_2x2.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./stl/cable_hive_punch_cut_with_screwmount_3x3.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./stl/cable_hive_punch_cut_with_screwmount_4x5.stl ${MODELFILE}

solid_wall_with_screwmount:
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./stl/cable_hive_solid_wall_with_screwmount_1x1.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./stl/cable_hive_solid_wall_with_screwmount_2x2.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./stl/cable_hive_solid_wall_with_screwmount_3x3.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./stl/cable_hive_solid_wall_with_screwmount_4x5.stl ${MODELFILE}

hive_for_mk3s_plus_buildplate:
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_punch_cut_6x5.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D lengthwise_cuts_count=2 -o ./stl/cable_hive_double_sized_6x5.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_solid_wall_6x5.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_boxed_wall_6x5.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./stl/cable_hive_solid_wall_with_screwmount_6x5.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=6 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_punch_cut_6x6.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=6 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D lengthwise_cuts_count=2 -o ./stl/cable_hive_double_sized_6x6.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=6 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_solid_wall_6x6.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=6 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_boxed_wall_6x6.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=6 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=true  -o ./stl/cable_hive_solid_wall_with_screwmount_6x6.stl ${MODELFILE}

business_card_holders:
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D cable_slot_lower_height=10 -o ./stl/businesscard_hive_6x5.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D I_want_smooth_slope_cuts=true -D cable_slot_lower_height=10 -o ./stl/businesscard_hive_slope_6x5.stl ${MODELFILE}

clean:
	rm ./png/*
	rm ./stl/*

