extends Node2D

var main
var pauser
var ai
var moves = {
	
}

var current_ani = [0,"idle"]
@onready var main_sprite = get_node("Sprite2D")
var pos = [0,0,0]#grid pos

func start(main_,pauser_):
	main = main_
	pauser = pauser_
	main.get_node("World").animation_list[self] = self



func new_animation(which):
	current_ani = [0,which]

func ani_ended():
	var new = ai.get_new_ani()
	new_animation(new)

var anis = {
	"idle": [
		{"fc":Vector2(0,0.01)},
		{"fc":Vector2(1,0.01)},
		{"fc":Vector2(2,0.01)},
		{"fc":Vector2(3,0.01)},
	],
	"move": [
		{"fc":Vector2(4,0.01),"move":0.01},
		{"fc":Vector2(5,0.01),"move":0.01},
		{"fc":Vector2(6,0.01),"move":0.01},
		{"fc":Vector2(7,0.01),"move":0.01},
	]
}
