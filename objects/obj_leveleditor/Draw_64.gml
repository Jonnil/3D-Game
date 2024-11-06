draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(10,10,

"LEVEL NAME: " +string(level_name) + "\n" +
"build_mode: " +string(build_mode) + "\n" +
"temp_x1: " +string(temp_x1) + "\n" +
"temp_y1: " +string(temp_y1) + "\n" +
"temp_x2: " +string(temp_x2) + "\n" +
"temp_y2: " +string(temp_y2) + "\n" + "\n" +
"mouse_x: " +string(mouse_x) + "\n" +
"mouse_y: " +string(mouse_y) + "\n" + "\n" +
"placed objects: " +string(instance_number(obj_leveleditor_placed_object)) + "\n" + "\n" +
"mode: " +string(mode)



)

draw_text(256, 10,

"1 - wall_mode" + "\n" +
"2 - decoration_mode"

)


draw_sprite(texture,subimg,156,48)
draw_text(156,120,"subimg: " +string(subimg))






if keyboard_check(vk_control)
{
draw_line_width_color(80,room_height - 30,room_width - 80,room_height -  30, 10, c_yellow, c_yellow)
}

if result_timer > 0
{
	var result_color = c_red;
	if (result_positivity)
	{
		result_color = c_lime;
		draw_line_width_color(room_width - 40,room_height - 80,room_width - 60,room_height -  35, 8, c_lime, c_lime);
		draw_line_width_color(room_width - 85,room_height - 50,room_width - 60,room_height -  35, 8, c_lime, c_lime);
	}
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_text_transformed_color(room_width - 90, room_height - 40, string(result_message), 2, 2, 0, result_color, result_color, result_color, result_color, 1);
	result_timer --
}

