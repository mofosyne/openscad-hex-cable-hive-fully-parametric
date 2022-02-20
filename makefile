MKDIR_P = mkdir -p
MODELFILE=cable_hive.scad

all: imageRender punch_cut solid_wall

imageRender:
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -o ./png/cable_hive_punch_cut_1x1.png ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -o ./png/cable_hive_punch_cut_2x2.png ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -o ./png/cable_hive_punch_cut_3x3.png ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -o ./png/cable_hive_punch_cut_4x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -o ./png/cable_hive_solid_wall_1x1.png ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -o ./png/cable_hive_solid_wall_2x2.png ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -o ./png/cable_hive_solid_wall_3x3.png ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -o ./png/cable_hive_solid_wall_4x5.png ${MODELFILE}
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -o ./png/cable_hive_boxed_wall_1x1.png ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -o ./png/cable_hive_boxed_wall_2x2.png ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -o ./png/cable_hive_boxed_wall_3x3.png ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -o ./png/cable_hive_boxed_wall_4x5.png ${MODELFILE}

punch_cut:
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -o ./stl/cable_hive_punch_cut_1x1.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -o ./stl/cable_hive_punch_cut_2x2.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -o ./stl/cable_hive_punch_cut_3x3.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=true  -D I_want_a_surrounding_wall=false -o ./stl/cable_hive_punch_cut_4x5.stl ${MODELFILE}

solid_wall:
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -o ./stl/cable_hive_solid_wall_1x1.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -o ./stl/cable_hive_solid_wall_2x2.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -o ./stl/cable_hive_solid_wall_3x3.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=false -o ./stl/cable_hive_solid_wall_4x5.stl ${MODELFILE}

solid_wall:
	openscad -m make -D nb_slots_X=1 -D nb_slots_Y=1 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -o ./stl/cable_hive_boxed_wall_1x1.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=2 -D nb_slots_Y=2 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -o ./stl/cable_hive_boxed_wall_2x2.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=3 -D nb_slots_Y=3 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -o ./stl/cable_hive_boxed_wall_3x3.stl ${MODELFILE}
	openscad -m make -D nb_slots_X=4 -D nb_slots_Y=5 -D I_want_side_wall_punch=false -D I_want_a_surrounding_wall=true  -o ./stl/cable_hive_boxed_wall_4x5.stl ${MODELFILE}

clean:
	rm ./png/*
	rm ./stl/*

