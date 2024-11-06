randomize();

xfrom = x;
yfrom = y;
zfrom = 0;

first_person_camera = false;
camera_distance = 180;
camera_distance_max = 300;

pitch = 0;
direction = 0;
z = 2;

global.mouse_last_x = 0; /* Store the last known X position of the mouse */
global.mouse_last_y = 0; /* Store the last known Y position of the mouse */
global.mouse_moving = false; /* Flag to track mouse movement state */

if (os_type == os_macosx) {
	mouse_center_y_offset = 53; /* On my Macbook, I need this for some reason */
} else {
	mouse_center_y_offset = 0;
}

window_set_cursor(cr_none); /* Hide the cursor on screen */

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

gpu_set_alphatestenable(true)
gpu_set_alphatestref(10)

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
vertex_format_add_texcoord();
format = vertex_format_end();

draw_set_lighting(true);
draw_light_enable(1, true);
gpu_set_fog(true, c_black, 100, 1000);
gpu_set_cullmode(cull_clockwise);



/*
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
*/

/* Create the ground to walk on */
vbuffer = vertex_create_buffer();
vertex_begin(vbuffer, format);

floor_sprite = spr_DOOM_dirt

var floor_z = 0;
var _uv_data = sprite_get_uvs(floor_sprite, 0);
var _umin = _uv_data[0], _vmin = _uv_data[1], _umax = _uv_data[2], _vmax = _uv_data[3];


var s = 64;
for (var i = 0; i < room_width*20; i += s) {
	for (var j = 0; j < room_height*20; j += s) {
		if ((i % (s * 2) == 0 && j % (s * 2) == 0) || (i % (s * 2) > 0 && j % (s * 2) > 0)) {
			var color = c_white;
		} else {
			var color = c_white;
		}
		
		vertex_add_point(vbuffer, i,		j,			floor_z,		0, 0, 1,		_umin, _vmin,		color, 1);
		vertex_add_point(vbuffer, i,		j + s,		floor_z,		0, 0, 1,		_umax, _vmin,		color, 1);
		vertex_add_point(vbuffer, i + s,	j + s,		floor_z,		0, 0, 1,		_umax, _vmax,		color, 1);
		
		vertex_add_point(vbuffer, i + s,	j + s,		floor_z,		0, 0, 1,		_umax, _vmax,		color, 1);
		vertex_add_point(vbuffer, i + s,	j,			floor_z,		0, 0, 1,		_umin, _vmax,		color, 1);
		vertex_add_point(vbuffer, i,		j,			floor_z,		0, 0, 1,		_umin, _vmin,		color, 1);
	}
}

vertex_end(vbuffer);