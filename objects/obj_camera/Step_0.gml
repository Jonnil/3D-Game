/* Check if the mouse position has changed since the last step */
if (mouse_x != global.mouse_last_x || mouse_y != global.mouse_last_y) {
    if (!global.mouse_moving) { /* Mouse is moving */
        global.mouse_moving = true; /* Mouse was not moving before, now it's moving */
    }
    
    /* Update last known mouse position */
    global.mouse_last_x = mouse_x;
    global.mouse_last_y = mouse_y;
} else if (mouse_x == global.mouse_last_x && mouse_y == global.mouse_last_y) {
    if (global.mouse_moving) { /* Mouse is not moving */
        global.mouse_moving = false; /* Mouse was moving before, now it's not moving */
    }
}

window_mouse_set(window_get_width() / 2, window_get_height() / 2); /* Set the mouse position to be in center of window */

if (keyboard_check(vk_escape)){
    game_end();
}

var camera_distance_min = 100;

if (mouse_wheel_down()
&& first_person_camera)
{
	camera_distance = camera_distance_min;
	first_person_camera = false;
	obj_player.look_pitch = 0;
	obj_player.visible = true;
}
else
if (mouse_wheel_down()
&& camera_distance < camera_distance_max)
{
	camera_distance += 10;
}
else
if (mouse_wheel_up()
&& camera_distance <= camera_distance_min && !first_person_camera)
{
	camera_distance = 1;
	first_person_camera = true;
	obj_player.look_pitch = 0;
	obj_player.visible = false;
}
else
if (mouse_wheel_up())
{
	camera_distance -= 10;
}

camera_distance = clamp(camera_distance, 1, camera_distance_max);

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

draw_light_define_point(1, xfrom, yfrom, zfrom, room_width, c_white);