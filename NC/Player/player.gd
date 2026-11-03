extends Node2D

var main
var pauser
var direction_facing = 0 #forward, left, right, back (0-3)
var current_ani = [0,"idle"]
@onready var main_sprite = get_node("Sprite2D")

func start(main_,pauser_):
	main = main_
	pauser = pauser_
	main.get_node("World").animation_list[self] = self


func new_animation(which):
	current_ani = [0,which]

func ani_ended():#This NEEDS to send to another animation or else the current ani goes over
	new_animation("idle")

var anis = {
	"idle": [
		{"fc":Vector2(0,direction_facing)},
		{"fc":Vector2(1,direction_facing)},
		{"fc":Vector2(2,direction_facing)},
		{"fc":Vector2(3,direction_facing)},
	],
	"move": [
		{"an":15,"move":0},
		{"an":16,"move":0},
		{"an":17,"move":0},
		{"an":18,"move":0},
		{"an":19,"move":0},
		{"an":20,"move":0},
		{"an":21,"move":0},
		{"an":22,"move":0}
	]
}
