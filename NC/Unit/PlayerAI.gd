extends Node2D

@onready var sprite = get_node("Sprite2D")



func _ready() -> void:
	get_parent().ai = self

func ani_frame(which):
	var to_return = [Vector2(0,0),Vector2(0,0)]
	if which == "idle":
		to_return = [Vector2i(0,get_parent().moves["horz"].direction_facing),Vector2i(3,get_parent().moves["horz"].direction_facing)]
	return to_return

var current_action = "idle"
#current_want?

func going_to_idle():
	pass
	#will change parents active_move to a valid move listed

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
