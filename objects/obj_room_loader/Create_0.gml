if (file_exists(string(room_get_name) + ".json"))
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
			}
			/* Reset the var struct variables after creating the object */
			var_struct.x1 = 0;
			var_struct.y1 = 0;
			var_struct.x2 = 0;
			var_struct.y2 = 0;
			var_struct.sprite = 0;
		}
		
		ds_list_destroy(placed_objects_list);
	}
	else
	{
		result_timer = result_duration
		result_positivity = false;
		result_message = string(level_name) + " was not found!";
	}