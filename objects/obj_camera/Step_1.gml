/// @description Move around

// This is pretty much all movement code from 3D in older versions of Game Maker.

direction -= (display_mouse_get_x() - display_get_width() / 2) / 10;
pitch = clamp(pitch - (display_mouse_get_y() - display_get_height() / 2) / 10, -80, 80);

display_mouse_set(display_get_width() / 2, display_get_height() / 2);
window_set_cursor(cr_none); /* Hide the cursor on screen */

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