if mode = "wall_mode"
	{
		if instance_exists(obj_camera)
		{

			if vbuffer_created = 0
			{
		
			var _uv_data = sprite_get_uvs(sprite, subimg);
			var _umin = _uv_data[0], _vmin = _uv_data[1], _umax = _uv_data[2], _vmax = _uv_data[3];

			vb = vertex_create_buffer();
			vertex_format_begin();
			vertex_format_add_position_3d();
			vertex_format_add_colour();
			vertex_format_add_texcoord();
			format = vertex_format_end();
			vertex_begin(vb, format);

		// TEXTURE IS FLIPPED HORIZONTALLY!!!!!!!!!!!!!!!!!!!!!!!

			vertex_position_3d(vb,   x2,   y2, height); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umin, _vmin);
			vertex_position_3d(vb,   x1,   y1, height); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umax, _vmin);
			vertex_position_3d(vb,   x2,   y2, 0); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umin, _vmax);

			vertex_position_3d(vb,   x1,   y1, 0); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umax, _vmax);
			vertex_position_3d(vb,   x2,   y2, 0); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umin, _vmax);
			vertex_position_3d(vb,   x1,   y1, height); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umax, _vmin);

			vertex_end(vb);
	

	
			vbuffer_created = 1
			}

		var _tex = sprite_get_texture(sprite, subimg);
		vertex_submit(vb, pr_trianglelist, _tex);





		}
		else
		{

		#region /* Level editor graphics */

		draw_line_width_color(x1,y1,x2,y2,2,c_white,c_white)

		draw_circle_color(x,y,8,c_white,c_white,true)
		draw_circle_color(x1,y1,10,c_white,c_white,true)

		draw_circle_color(x2,y2,6,c_white,c_white,true)

		draw_line(x,y,
		x + lengthdir_x(32, point_direction(x1,y1,x2,y2)+270),
		y + lengthdir_y(32, point_direction(x1,y1,x2,y2)+270))

		#endregion /* Level editor graphics END*/

		}




}











if mode = "decoration_mode"
{

if instance_exists(obj_player)
	{

		x1 = x - lengthdir_x(32,point_direction(x,y,obj_player.x,obj_player.y)+90	)
		y1 = y - lengthdir_y(32,point_direction(x,y,obj_player.x,obj_player.y)+90	)
		x2 = x + lengthdir_x(32,point_direction(x,y,obj_player.x,obj_player.y)+90	)
		y2 = y + lengthdir_y(32,point_direction(x,y,obj_player.x,obj_player.y)+90	)

	}
else
	{
		draw_sprite(sprite,subimg,x - 32,y - 64)
		draw_circle(x,y,8,true)	
	}



if instance_exists(obj_camera) and instance_exists(obj_player)
	{
		if irandom_range(0,distance_to_object(obj_player) / 16) = 0
		{
			_uv_data = sprite_get_uvs(sprite, subimg);
			_umin = _uv_data[0]
			_vmin = _uv_data[1]
			_umax = _uv_data[2]
			_vmax = _uv_data[3]

			vb = vertex_create_buffer();
			vertex_format_begin();
			vertex_format_add_position_3d();
			vertex_format_add_colour();
			vertex_format_add_texcoord();
			format = vertex_format_end();
			vertex_begin(vb, format);

			// TEXTURE IS FLIPPED HORIZONTALLY!!!!!!!!!!!!!!!!!!!!!!!

			vertex_position_3d(vb,   x2,   y2, 64); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umin, _vmin);
			vertex_position_3d(vb,   x1,   y1, 64); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umax, _vmin);
			vertex_position_3d(vb,   x2,   y2, 0); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umin, _vmax);

			vertex_position_3d(vb,   x1,   y1, 0); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umax, _vmax);
			vertex_position_3d(vb,   x2,   y2, 0); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umin, _vmax);
			vertex_position_3d(vb,   x1,   y1, 64); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umax, _vmin);

			vertex_end(vb);
		}




		_tex = sprite_get_texture(sprite, subimg);
		vertex_submit(vb, pr_trianglelist, _tex);

	
	}













}










