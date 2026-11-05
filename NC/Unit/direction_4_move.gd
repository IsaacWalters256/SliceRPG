extends Node2D

var direction_facing = 0 #forward, left, right, back (0-3)

func _ready() -> void:
	get_parent().moves["direction"] = self
