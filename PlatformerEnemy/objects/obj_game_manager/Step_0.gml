if obj_player.x >= window_get_width()/2{
    if obj_player.x <= room_width-(window_get_width()*0.5){
        camera_set_view_pos(view_camera[0],obj_player.x-(window_get_width()/2),0)
    }
}