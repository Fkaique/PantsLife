var _up, _left, _lower, _right, _jump
_up = keyboard_check(input.up)
_left = keyboard_check(input.left)
_lower = keyboard_check(input.lower)
_right = keyboard_check(input.right)
_jump = keyboard_check_pressed(input.jump)

hspd = (_right-_left) * spd
// vspd = (_lower-_up) * spd

if place_meeting(x+hspd,y,obj_colision){
	while !place_meeting(x+sign(hspd),y,obj_colision){
		x+=sign(hspd)
	}
	hspd=0	
}
x+=hspd
if place_meeting(x,y+vspd,obj_colision){
	while !place_meeting(x,y+sign(vspd),obj_colision){
		y+=sign(vspd)
	}
	vspd=0	
}

vspd = clamp(vspd, -jump, jump);
y+=vspd

if !place_meeting(x,y+1,obj_colision){
	vspd+=grav	
	if !alarm1 and !jumping{
		alarm[1]=10
		alarm1=true
	}
}else{
	isFalling=false
	alarm1=false
	jumping=false
}
if !isFalling and _jump and !jumping{
	vspd=-jump
	jumping=true
}

if _left{
	sprite_index=spr_pants_run
}else if _right{
	sprite_index=spr_pants_run
}

if hspd!=0{
	image_xscale=sign(hspd)
}else if _lower{
	sprite_index=spr_pants_lowered	
}else{
	sprite_index=spr_pants_idle
}

if take_damage{
	alarm[0]=120
}
show_debug_message(life)