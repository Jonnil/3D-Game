randomize()

max_speed = 4;

pitch = 0;
direction = 0;
z = 32;

global.mouse_last_x = 0; /* Store the last known X position of the mouse */
global.mouse_last_y = 0; /* Store the last known Y position of the mouse */
global.mouse_moving = false; /* Flag to track mouse movement state */

display_center_width = display_get_width() / 2;
display_center_height = display_get_height() / 2;
if (os_type == os_macosx) {
	mouse_center_y_offset = 53; /* On my Macbook, I need this for some reason */
} else {
	mouse_center_y_offset = 0;
}

window_set_cursor(cr_none); /* Hide the cursor on screen */

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
vertex_format_add_texcoord();
format = vertex_format_end();

draw_set_lighting(true);
draw_light_enable(1, true);
gpu_set_fog(true, c_maroon, 100, 1000);
gpu_set_cullmode(cull_clockwise);

var mario = instance_create_depth(500, 500, depth, obj_game_object);
mario.model = load_obj("mario.obj", "mario.mtl");
mario.z = 0;

var pb = instance_create_depth(700, 800, depth, obj_game_object);
pb.model = load_obj("paulblartmonkeycop.obj", "paulblartmonkeycop.mtl");
pb.z = 0;

var cube = instance_create_depth(100, 101, depth, obj_game_object);
cube.model = load_obj("cube.obj", "cube.mtl");
cube.z = 0;

var monkey = instance_create_depth(510, 595, depth, obj_game_object);
monkey.model = load_obj("monkey3.obj", "monkey3.mtl");
monkey.z = 0;

var monkeysmooth = instance_create_depth(650, 345, depth, obj_game_object);
monkeysmooth.model = load_obj("monkey4.obj", "monkey4.mtl");
monkeysmooth.z = 0;


/* Create the ground to walk on */
vbuffer = vertex_create_buffer();
vertex_begin(vbuffer, format);

var floor_z = 0;

var s = 32;
for (var i = 0; i < room_width; i += s) {
	for (var j = 0; j < room_height; j += s) {
		if ((i % (s * 2) == 0 && j % (s * 2) == 0) || (i % (s * 2) > 0 && j % (s * 2) > 0)) {
			var color = c_red;
		} else {
			var color = c_white;
		}
		
		vertex_add_point(vbuffer, i,		j,			floor_z,		0, 0, 1,		0, 0,		color, 1);
		vertex_add_point(vbuffer, i,		j + s,		floor_z,		0, 0, 1,		1, 0,		color, 1);
		vertex_add_point(vbuffer, i + s,	j + s,		floor_z,		0, 0, 1,		1, 1,		color, 1);
		
		vertex_add_point(vbuffer, i + s,	j + s,		floor_z,		0, 0, 1,		1, 1,		color, 1);
		vertex_add_point(vbuffer, i + s,	j,			floor_z,		0, 0, 1,		0, 1,		color, 1);
		vertex_add_point(vbuffer, i,		j,			floor_z,		0, 0, 1,		0, 0,		color, 1);
	}
}

vertex_end(vbuffer);