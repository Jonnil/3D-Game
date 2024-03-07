// Game Objects are invisible by default
draw_set_color(c_white);
var tsine = dsin(current_time);
var t = current_time / 50;
var matrix = matrix_build(x, y, z + tsine, 0, 0, t, 1, 1, 1);
matrix_set(matrix_world, matrix);
vertex_submit(model, pr_trianglelist, -1); /* Primitive should be pr_trianglelist */
matrix_set(matrix_world, matrix_build_identity());