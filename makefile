MKDIR_P = mkdir -p
MODELFILE=cable_hive.scad

all: imageRender punch_cut solid_wall boxed_wall punch_cut_with_screwmount solid_wall_with_screwmount business_card_holders

imageRender:
# Cable Hives
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_punch_cut_1x1.png ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_punch_cut_2x2.png ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_punch_cut_3x3.png ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./png/cable_hive_punch_cut_4x5.png ${MODELFILE}
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
# Business Card Hive
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D cable_slot_lower_height=30 -o ./png/businesscard_hive_6x5.png ${MODELFILE}

punch_cut:
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_punch_cut_1x1.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_punch_cut_2x2.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_punch_cut_3x3.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -o ./stl/cable_hive_punch_cut_4x5.stl ${MODELFILE}

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

business_card_holders:
	openscad -m make -D nb_slots_X=6 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -D I_want_mounting_screw_holes=false -D I_want_lengthwise_cuts=true -D cable_slot_lower_height=20 -o ./stl/businesscard_hive_6x5.stl ${MODELFILE}

clean:
	rm ./png/*
	rm ./stl/*

