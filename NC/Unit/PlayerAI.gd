extends Node2D

@onready var sprite = get_node("Sprite2D")
@onready var g = get_parent()


func _ready() -> void:
	get_parent().ai = self

#func ani_frame(which):
	#var to_return = [Vector2(0,0),Vector2(0,0)]
	#if which == "idle":
		#to_return = [Vector2i(0,get_parent().direction_facing),Vector2i(3,get_parent().direction_facing)]
	#elif which == "move":
		#to_return = [Vector2i(4,get_parent().direction_facing),Vector2i(7,get_parent().direction_facing)]
	#return to_return

var current_action = "idle"
#current_want?

func run_ani(which):
	if which == "idle":
		get_node("AnimatedSprite2D").play("idle"+str(g.direction_facing))
	elif which == "move":
		get_node("AnimatedSprite2D").play("move"+str(g.direction_facing))

func going_to_idle():
	pass
	if Input.is_action_pressed("left"):
		g.change_direction(1)
		get_parent().active_move = get_parent().moves["horz"]
	elif Input.is_action_pressed("right"):
		g.change_direction(2)
		get_parent().active_move = get_parent().moves["horz"]

func _process(delta: float) -> void:
	get_node("Label").text = str(get_node("Sprite2D").frame)
	if Input.is_action_just_pressed("down"):
		g.change_direction(0)
	elif Input.is_action_just_pressed("left"):
		g.change_direction(1)
		if g.active_move == g.moves["idle"]:
			g.active_move = g.moves["horz"]
			g.active_move.activate()
	elif Input.is_action_just_pressed("right"):
		g.change_direction(2)
		if g.active_move == g.moves["idle"]:
			g.active_move = g.moves["horz"]
			g.moves["horz"].activate()
	elif Input.is_action_just_pressed("up"):
		g.change_direction(3)
	
	if g.active_move == g.moves["horz"]:
		if Input.is_action_just_released("left") && g.direction_facing == 1:
			g.moves["horz"].interupted()
			g.ani_natural_end()
		if Input.is_action_just_released("right") && g.direction_facing == 2:
			g.moves["horz"].interupted()
			g.ani_natural_end()
