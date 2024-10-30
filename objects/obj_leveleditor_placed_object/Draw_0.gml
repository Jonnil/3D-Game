draw_line_width_color(x1,y1,x2,y2,width,c_white,c_white)


draw_circle_color(x,y,8,c_white,c_white,true)
draw_circle_color(x1,y1,10,c_white,c_white,true)

draw_circle_color(x2,y2,6,c_white,c_white,true)

draw_line(x,y,
x + lengthdir_x(32, point_direction(x1,y1,x2,y2)+270),
y + lengthdir_y(32, point_direction(x1,y1,x2,y2)+270))






if instance_exists(obj_camera)
{

	if draw_3d = 0
	{

	var _uv_data = sprite_get_uvs(spr_white, 0);
	var _umin = _uv_data[0], _vmin = _uv_data[1], _umax = _uv_data[2], _vmax = _uv_data[3];

	vb = vertex_create_buffer();
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_colour();
	vertex_format_add_texcoord();
	format = vertex_format_end();
	vertex_begin(vb, format);

// TEXTURE IS FLIPPED HORIZONTALLY!!!!!!!!!!!!!!!!!!!!!!!

	vertex_position_3d(vb,   x2,   y2, 300); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umin, _vmin);
	vertex_position_3d(vb,   x1,   y1, 300); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umax, _vmin);
	vertex_position_3d(vb,   x2,   y2, 0); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umin, _vmax);

	vertex_position_3d(vb,   x1,   y1, 0); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umax, _vmax);
	vertex_position_3d(vb,   x2,   y2, 0); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umin, _vmax);
	vertex_position_3d(vb,   x1,   y1, 300); vertex_color(vb, c_white, 1); vertex_texcoord(vb, _umax, _vmin);



	vertex_end(vb);
	
	draw_3d = 1
	

	}



var _tex = sprite_get_texture(spr_grass, 0);
vertex_submit(vb, pr_trianglelist, _tex);


}



