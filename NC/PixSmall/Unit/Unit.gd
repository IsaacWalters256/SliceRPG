extends Node2D

var main
var pauser
var ai
var tw
var moves = {
	
}

var direction_facing = 1
@onready var active_move# = get_node("IdleMove")
#var pos = [0,0,0]#grid pos

func start(main_,pauser_):
	main = main_
	pauser = pauser_
	active_move = moves["idle"]
	#main.get_node("World").animation_list[self] = self
	ani_natural_end()

func change_direction(new):
	if direction_facing != new:
		direction_facing = new
		if active_move.can_change_direction:
			active_move.interupted()
			active_move.activate()
		

func ani_natural_end():
	active_move = moves["idle"]
	ai.going_to_idle()
	#if active_move == moves["idle"]:
	active_move.activate()
