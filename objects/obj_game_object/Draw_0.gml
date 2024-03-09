// Game Objects are invisible by default
draw_set_color(c_white);
//var tsine = dsin(current_time);
//var t = current_time / 50;

var matrix =	matrix_build(x, y, z,	xrotation, yrotation, zrotation,	xscale, yscale, zscale);
//var matrix_translate =	matrix_build(x, y, z,	0, 0, 0,	1, 1, 1);
//var matrix_rotate =		matrix_build(0, 0, 0,	0, t, 0,	1, 1, 1);
//var matrix_scale =		matrix_build(0, 0, 0,	0, 0, 0,	1, tsine, 1);

//var matrix_sr =			matrix_multiply(matrix_scale, matrix_rotate);
//var matrix_final =		matrix_multiply(matrix_sr, matrix_translate);

matrix_set(matrix_world, matrix);

vertex_submit(model, pr_trianglelist, -1); /* Primitive should be pr_trianglelist */

matrix_set(matrix_world, matrix_build_identity());