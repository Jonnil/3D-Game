if keyboard_check_pressed(ord("1")) {mode = "wall_mode"}
if keyboard_check_pressed(ord("2")) {mode = "decoration_mode"}







#region /*Build mode*/


	if keyboard_check_pressed(vk_up)
	{
		var new_texture = get_string("sprite name: ","")	
		if sprite_exists(asset_get_index(new_texture))
		{
			texture = asset_get_index(new_texture)
		}
		else
		{
			show_message("doesnt exi")
		}
	}


	if keyboard_check_pressed(vk_left)
	{
		if subimg != 0
		{
			subimg --
		}
		
	}
	
	if keyboard_check_pressed(vk_right)     //ADD CAP IF POSSIBLE
	{
		subimg ++
		
	}




	if mouse_check_button_pressed(mb_right)
	{
		if build_mode = 0
		{
			temp_x1 = mouse_x
			temp_y1 = mouse_y
			
			build_mode = 1
		}
		else
		if build_mode = 1
		{
			build_mode = 0;
			temp_x1 = mouse_x
			temp_y1 = mouse_y
			temp_x2 = mouse_x
			temp_y2 = mouse_y
		}
	}

	if mouse_check_button_pressed(mb_left)
	{
		if build_mode = 1
		{
			temp_x2 = mouse_x
			temp_y2 = mouse_y
		
			obj = instance_create_depth(temp_x1, temp_y1, 0, obj_leveleditor_placed_object)
			obj.x1 = temp_x1;
			obj.y1 = temp_y1;
			obj.x2 = temp_x2;
			obj.y2 = temp_y2;
			obj.sprite = texture
			obj.subimg = subimg
			obj.mode = string(mode)
			
			temp_x1 = temp_x2;
			temp_y1 = temp_y2;
		}
	}


	if build_mode = 1
	{
		draw_line_width_color(temp_x1,temp_y1,mouse_x,mouse_y,2,c_ltgray,c_ltgray)

		draw_line(temp_x1,temp_y1,
	temp_x1 + lengthdir_x(32, point_direction(temp_x1,temp_y1,mouse_x,mouse_y)+270),
	temp_y1 + lengthdir_y(32, point_direction(temp_x1,temp_y1,mouse_x,mouse_y)+270))


	}

#endregion /*Build mode END*/



#region /* CTRL */
if keyboard_check(vk_control)
{


#region /* Playtest */

if keyboard_check(ord("P"))
{
	instance_create_depth(room_width/2,room_height/2,0,obj_camera)
	instance_create_depth(room_width/2,room_height/2,0,obj_player)


}



#endregion /* Playtest END */


#region /* Save */
if keyboard_check_pressed(ord("S"))
{
	result_timer = result_duration
	result_positivity = true;
	result_message = string(level_name) + " Saved!";
	
	var file = file_text_open_write(string(level_name) + ".json");
	var data = [];
	with(obj_leveleditor_placed_object)
	{
		var obj_data =
		{
			x1: string(x1),
			y1: string(y1),
			x2: string(x2),
			y2: string(y2),
			sprite: sprite,
			subimg: subimg,
			mode: string(mode)
		};
		data[array_length_1d(data)] = obj_data;
	}
	var json_string = json_stringify(data);
	file_text_write_string(file, json_string); /* Write string with wall information to file and start a new line */
	file_text_close(file);
}
#endregion /* Save END */











#region /* Load */
if keyboard_check_pressed(ord("L"))
{
	level_name = get_string("What level do you want to load?", "");
	
	if (file_exists(string(level_name) + ".json"))
	{
		with(obj_leveleditor_placed_object)
		{
			effect_create_above(ef_firework, x, y, 1, c_white)
			instance_destroy();
		}
		
		result_timer = result_duration
		result_positivity = true;
		result_message = string(level_name) + " Loaded!";
		
		var var_struct = {x1 : 0, y1 : 0, x2 : 0, y2 : 1};
		
		var placed_objects_list = ds_list_create(); /* Only create a DS list if the file exists */
		var file = file_text_open_read(string(level_name) + ".json")
		var json_string = file_text_read_string(file);
		file_text_close(file);
		
		var data = json_parse(json_string);
		
		for(var i = 0; i < array_length(data); i++)
		{
			var_struct = data[i];
			ds_list_add(placed_objects_list);
			
			new_obj = instance_create_depth(real(var_struct.x1), real(var_struct.y1), 0, obj_leveleditor_placed_object);
			if (new_obj)
			{
				new_obj.x1 = var_struct.x1;
				new_obj.y1 = var_struct.y1;
				new_obj.x2 = var_struct.x2;
				new_obj.y2 = var_struct.y2;
				new_obj.sprite = var_struct.sprite;
				new_obj.subimg = var_struct.subimg;
				new_obj.mode = var_struct.mode;
			}
			/* Reset the var struct variables after creating the object */
			var_struct.x1 = 0;
			var_struct.y1 = 0;
			var_struct.x2 = 0;
			var_struct.y2 = 0;
			var_struct.sprite = 0;
			var_struct.subimg = 0;
			var_struct.mode = 0;
		}
		
		ds_list_destroy(placed_objects_list);
	}
	else
	{
		result_timer = result_duration
		result_positivity = false;
		result_message = string(level_name) + " was not found!";
	}
}
#endregion /* Load END */


}
#endregion /* CTRL END */