extends Node2D

var locked = false
var forced_movement = -1 #-1 is no direction
var input_movement = -1

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
