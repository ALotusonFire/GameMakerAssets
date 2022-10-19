/// @description Insert description here
// You can write your code in this editor


if bumped_into_something{
	bumped_into_something = false
	
	if L_hold{
		R_hold = true
		L_hold = false
	
	}else{
		L_hold = true
		R_hold = false
	}

}

if !collision_circle(x+(sprite_width/2),y,4,obj_collidable,false,true){
	if knows_edge = true{
		if grounded {
			if L_hold{
				hspd = 0
				R_hold = true
				L_hold = false
			}else{
				hspd = 0
				L_hold = true
				R_hold = false
			}
		}
	}
}

hits = 0

if collision_circle(x,y,30,obj_player,false,true){
			hits += 1
			if (hits = 5){
			instance_destroy(obj_player)
			room_restart()}
	}
	
if collision_circle(x,y,30,obj_IceBucket,false,true){
	hspd_max = 1
}
	
// Inherit the parent event
event_inherited();



