/* Check if the mouse position has changed since the last step */
if (mouse_x != global.mouse_last_x || mouse_y != global.mouse_last_y) {
    if (!global.mouse_moving) { /* Mouse is moving */
        global.mouse_moving = true; /* Mouse was not moving before, now it's moving */
    }
    
    /* Update last known mouse position */
    global.mouse_last_x = mouse_x;
    global.mouse_last_y = mouse_y;
} else if (mouse_x == global.mouse_last_x && mouse_y == global.mouse_last_y) {
    if (global.mouse_moving) { /* Mouse is not moving */
        global.mouse_moving = false; /* Mouse was moving before, now it's not moving */
		display_mouse_set(display_center_width, display_center_height + mouse_center_y_offset); /* Set the mouse position to be in center of screen */
    }
}