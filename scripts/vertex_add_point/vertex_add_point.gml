function vertex_add_point(
vbuffer,
xx = x,
yy = y,
zz = 100,
nx = 0,
ny = 0,
nz = 1,
utex = 0,
vtex = 0,
color = c_white,
alpha = 1){
	vertex_position_3d(vbuffer, xx, yy, zz);
	vertex_normal(vbuffer, nx, ny, nz);
	vertex_color(vbuffer, color, alpha);
	vertex_texcoord(vbuffer, utex, vtex);
}


/*ALLLLLLLL THE VERTEX_POSITION,,,, TEXCOORD, COLOR ALL LTHAT SHIT 
NEEDS TO BE IN ORDER!!!
read the manual for vertex_begin


*/