var _up, _left, _lower, _right, _jump
_up = keyboard_check(input.up)
_left = keyboard_check(input.left)
_lower = keyboard_check(input.lower)
_right = keyboard_check(input.right)
_jump = keyboard_check(input.jump)

if _left{
	hspd=-spd
	sprite_index=spr_pants_run
}else if _right{
	sprite_index=spr_pants_run
	hspd=spd
}else{
	hspd=0
}
if hspd!=0{
	image_xscale=sign(hspd)
}else{
	sprite_index=spr_pants_idle
}
if place_meeting(x,y+vspd,obj_colision){
	if !place_meeting(x,y+sign(vspd),obj_colision){
		vspd++
	}
	vspd=0
}
if place_meeting(x,y+1,obj_colision){
	if _jump{
		vspd+=-jump
	}
}else{
	vspd+=grav	
}
show_debug_message(vspd)
y+=vspd
x+=hspd