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

if (keyboard_check(ord("A")) || keyboard_check(vk_left)){
	x -= dsin(direction) * 4;
	y -= dcos(direction) * 4;
}

if (keyboard_check(ord("S")) || keyboard_check(vk_down)){
	x -= dcos(direction) * 4;
	y += dsin(direction) * 4;
}

if (keyboard_check(ord("D")) || keyboard_check(vk_right)){
	x += dsin(direction) * 4;
	y += dcos(direction) * 4;
}

if (keyboard_check(ord("W")) || keyboard_check(vk_up)){
	x += dcos(direction) * 4;
	y -= dsin(direction) * 4;
}

draw_light_define_point(1, x, y, z, room_width, c_white);