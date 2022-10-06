#region base movement and animation related to keypress

vspd += grav_amt                                        //apply gravity

if L_hold{												// if pressing A..
    if (hspd > -hspd_max){
		hspd -= accel	                                //accelerate if not at max speed left
	} else { 
		hspd = -hspd_max 
	}
    image_xscale = -1									//flip the sprite to face left
    if grounded{
        sprite_index= my_spr_walk
    }
}else if R_hold{										//otherwise if D same deal in other direction...
        if (hspd < hspd_max){
			hspd += accel	
		} else {
			hspd = hspd_max
		}
    image_xscale = 1									//flip the sprite to face right
    if grounded{										//only change to walking sprite if on the ground
        sprite_index= my_spr_walk
    }
}else{		
	//if not pressing either direction..
    if grounded{
		hspd = lerp(hspd, 0, .05)						//..and on the ground.. slow me
        sprite_index= my_spr_idle					//..show idle animation!
    }
}



#endregion

#region jumping and falling

if action_1_hold{	// "input caching"
	jump_pressed = true
	alarm[1] = jump_pressed_timer		// saves the key press for some frames
}

if grounded {							// if player is touching the ground or platform
	vspd = 0							// set our jump value to 0 so we don't move
	
}else{									
										// if player is NOT on the ground..
	if just_jumped{
		if action_1_hold{	// ..allow player to hold the jump button for increased height
			jump_pressed = false
			vspd = -jump_max
		} else {
			just_jumped = false
			alarm[0] = 0
		}
	}
	
    if vspd > 0{						// use jump sprite for jump, fall sprite for fall!
        sprite_index= my_spr_jump
    }else{
        sprite_index= my_spr_fall
    }
}

if jump_pressed
and jumps_spent < num_jump {			//check for jump key only if we have jumps left to use
    jump_pressed = false				// turn off our jump key, because we used it
	vspd = -jump_max					// set our jump value to its max to start the jump
    								      
	if grounded == false{				// if not on the ground..
		jumps_spent += 1				// .. use an air jump
	}
	if jump_hold > 0{
		just_jumped = true
		alarm[0] = jump_hold
	}
		
	grounded=false						// we're not on the ground anymore! we jumped!
}

#endregion


#region movement and collisions

MoveCollide() // < - wow, big script!

//are we on the ground?
if(place_meeting(x, y+1, obj_platform)){
	alarm[2] = coyote_time				// while on a platform, hold this timer at maximum
	grounded = true
	jumps_spent = 0
} else {
	//grounded = false
}
#endregion