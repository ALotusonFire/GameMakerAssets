/// @description Insert description here
// You can write your code in this editor

hits = 0
x+=5
if collision_circle(x,y,30,obj_foe,false,true){
			instance_destroy()
			var enemy = instance_nearest(x,y,obj_foe)
		instance_destroy(enemy)
	}
if collision_circle(x,y,30,obj_lightblock,false,true){
			instance_destroy()
			var light = instance_nearest(x,y,obj_lightblock)
		instance_destroy(light)
	}