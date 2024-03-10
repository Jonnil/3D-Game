draw_set_color(c_white);
var matrix = matrix_build(x, y, z, xrotation, yrotation, zrotation, xscale, yscale, zscale);
matrix_set(matrix_world, matrix);
vertex_submit(model, pr_trianglelist, -1); /* Primitive should be pr_trianglelist */
matrix_set(matrix_world, matrix_build_identity());