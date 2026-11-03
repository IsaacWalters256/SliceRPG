extends Node2D

var main
var pauser
var player

var animation_list = {
	
}

func start(main_,pauser_):
	main = main_
	pauser = pauser_
	player = get_node("Player")
	player.start(main,pauser)
	
