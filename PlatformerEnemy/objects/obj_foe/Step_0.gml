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

y -= 1


// Inherit the parent event
event_inherited();

