sprite = spr_test
subimg = 0

x1 = x - 32
y1 = y - 32
x2 = x + 32
y2 = y + 32










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