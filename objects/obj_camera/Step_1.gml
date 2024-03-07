/// @description Move around

/* This is pretty much all movement code from 3D in older versions of Game Maker. */

if (global.mouse_moving) {
	direction -= (display_mouse_get_x() - display_center_width) / 10;
	pitch = clamp(pitch - (display_mouse_get_y() - display_center_height) / 10, -80, 80);
}

if (os_type != os_macosx) {
	display_mouse_set(display_center_width, display_center_height + mouse_center_y_offset); /* Set the mouse position to be in center of screen */
}

if (keyboard_check(vk_escape)){
    game_end();
}

if (keyboard_check(vk_shift)) {
	max_speed = 1; /* Walk slow with shift */
} else if (keyboard_check(vk_control)) {
	max_speed = 8; /* Walk fast with control */
} else {
	max_speed = 4; /* Otherwise walk normal speed */
}

if (keyboard_check(ord("A")) || keyboard_check(vk_left)){
	x -= dsin(direction) * max_speed;
	y -= dcos(direction) * max_speed;
}

if (keyboard_check(ord("S")) || keyboard_check(vk_down)){
	x -= dcos(direction) * max_speed;
	y += dsin(direction) * max_speed;
}

if (keyboard_check(ord("D")) || keyboard_check(vk_right)){
	x += dsin(direction) * max_speed;
	y += dcos(direction) * max_speed;
}

if (keyboard_check(ord("W")) || keyboard_check(vk_up)){
	x += dcos(direction) * max_speed;
	y -= dsin(direction) * max_speed;
}






if keyboard_check(vk_space){z += 2}
if keyboard_check(ord("Z")){z -= 2}

if keyboard_check(ord("R")){room_restart()}



	if keyboard_check(ord("M")){
	
	with(instance_create_depth(room_width/2, room_height/2, depth, obj_game_object))
	{
		model = load_obj("monkey3.obj", "");
		z = -20;
		speed = irandom_range(1,6)
		direction = irandom_range(0,360)
	}
	
	}





if mouse_check_button_pressed(mb_left){
	with(instance_create_depth(x, y, depth, obj_game_object))
	{
		model = load_obj("monkey3.obj", "");
		z = -20;
		speed = 4
		direction = obj_camera.direction
		
		
	}
}

draw_light_define_point(1, x, y, z, room_width, c_white);


