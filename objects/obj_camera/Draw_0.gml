draw_clear(c_black);

/* You can set the camera projection(s) at any point */
var camera = camera_get_active();

var xto = obj_player.x;
var yto = obj_player.y;
var zto = obj_player.z + 32;
xfrom = xto - camera_distance * dcos(obj_player.look_dir);
yfrom = yto + camera_distance * dsin(obj_player.look_dir);

if (first_person_camera) {
	zfrom = zto - camera_distance * dsin(obj_player.look_pitch);
} else {
	zfrom = zto + camera_distance * dsin(obj_player.look_pitch);
}

camera_set_view_mat(camera, matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(-60, -window_get_width() / window_get_height(), 1, 32000));
camera_apply(camera);

/* Anything drawn has to be drawn after the camera projections are set */
with (obj_game_object) event_perform(ev_draw, 0);

vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(floor_sprite, 0)); /* Draw the ground to walk on */