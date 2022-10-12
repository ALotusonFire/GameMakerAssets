/// @description Insert description here
// You can write your code in this editor

hits = 0
x+=5
if collision_circle(x,y,30,obj_foe,false,true){
			instance_destroy()
			hits += 1
			if (hits = 2){
			instance_destroy(obj_foe)}
	}
	
if collision_circle(x,y,30,obj_lightblock,false,true){
			instance_destroy()
			instance_destroy(obj_lightblock)
	}