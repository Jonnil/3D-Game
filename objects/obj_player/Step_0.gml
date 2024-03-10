look_dir -= (window_mouse_get_x() - window_get_width() / 2) / 10;
look_pitch -= (window_mouse_get_y() - window_get_height() / 2) / 10;
look_pitch = clamp(look_pitch, -80, +80);

zrotation = direction + 90; /* Set the character to face the direction of movement */

var max_acceleration = 0.4;

if (keyboard_check(vk_shift)) {
	max_speed = lerp(max_speed, 1, 0.1); /* Walk slow with shift */
} else if (keyboard_check(vk_control)) {
	max_speed = lerp(max_speed, 8, 0.1); /* Walk fast with control */
} else {
	max_speed = lerp(max_speed, 4, 0.1); /* Otherwise walk normal speed */
}

/* Calculate acceleration */
var acceleration_x = 0;
var acceleration_y = 0;

if (keyboard_check(ord("A")) || keyboard_check(vk_left)){
    acceleration_x -= dsin(look_dir) * max_acceleration;
    acceleration_y -= dcos(look_dir) * max_acceleration;
}
if (keyboard_check(ord("S")) || keyboard_check(vk_down)){
    acceleration_x -= dcos(look_dir) * max_acceleration;
    acceleration_y += dsin(look_dir) * max_acceleration;
}
if (keyboard_check(ord("D")) || keyboard_check(vk_right)){
    acceleration_x += dsin(look_dir) * max_acceleration;
    acceleration_y += dcos(look_dir) * max_acceleration;
}
if (keyboard_check(ord("W")) || keyboard_check(vk_up)){
    acceleration_x += dcos(look_dir) * max_acceleration;
    acceleration_y -= dsin(look_dir) * max_acceleration;
}

/* Apply acceleration */
hspeed += acceleration_x;
vspeed += acceleration_y;

/* Clamp speed to max speed */
var current_speed = point_distance(0, 0, hspeed, vspeed);
if (current_speed > max_speed) {
    var scale_factor = max_speed / current_speed;
    hspeed *= scale_factor;
    vspeed *= scale_factor;
}

friction = 0.2;