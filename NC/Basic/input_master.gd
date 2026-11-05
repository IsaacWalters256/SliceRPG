extends Node2D

func _ready() -> void:
	get_parent().ai = self

var current_action = "idle"

func get_new_ani():
	return current_action

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("basic_attack"):
		pass
	if Input.is_action_pressed("down"):
		current_action = "move"
		get_parent().moves["horz"].move_direction(0)
	elif Input.is_action_pressed("left"):
		current_action = "move"
		get_parent().moves["horz"].move_direction(1)
	elif Input.is_action_pressed("right"):
		current_action = "move"
		get_parent().moves["horz"].move_direction(2)
	elif Input.is_action_pressed("up"):
		current_action = "move"
		get_parent().moves["horz"].move_direction(3)
	else:
		current_action = "idle"
		get_parent().moves["horz"].move_direction(-1)
