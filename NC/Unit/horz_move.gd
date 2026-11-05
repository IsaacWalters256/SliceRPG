extends Node2D

#when this move is interupted, it can call force movement during certain moves so you keep going forward or what not
#have different sized ray casts (point them the right way), check the different sizes for how far it can go, if it can go, then go that far in the movement (also can use this for starting the speed out)

var locked = false
var forced_movement = -1 #-1 is no direction
var input_movement = -1
var direction_facing = 0 #forward, left, right, back (0-3)


func _ready() -> void:
	get_parent().moves["horz"] = self

func move_direction(d_number):
	input_movement = d_number

func move_tick():
	if (input_movement == -1 && get_parent().current_ani[1] == "move") || self.locked:
		get_parent().new_animation("idle")
	elif (get_parent().moves["direction"].direction_facing != input_movement) || get_parent().current_ani[1] != "move":
		if input_movement != -1:
			get_parent().moves["direction"].direction_facing = input_movement
		get_parent().new_animation("move")
	if input_movement != -1:
		if input_movement == 0:
			get_parent().position.y = get_parent().position.y + 3
		elif input_movement == 1:
			get_parent().position.x = get_parent().position.x - 4
		elif input_movement == 2:
			get_parent().position.x = get_parent().position.x + 4
		elif input_movement == 3:
			get_parent().position.y = get_parent().position.y - 3





























#
