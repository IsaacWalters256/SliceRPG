extends Node2D

var main
var pauser
var ai
var tw
var moves = {
	
}

@onready var active_move# = get_node("IdleMove")
#var pos = [0,0,0]#grid pos

func start(main_,pauser_):
	main = main_
	pauser = pauser_
	active_move = moves["idle"]
	#main.get_node("World").animation_list[self] = self
	ani_natural_end()

func ani_natural_end():
	ai.going_to_idle()
	#if active_move == moves["idle"]:
	active_move.activate()
