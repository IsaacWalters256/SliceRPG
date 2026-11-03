extends Node2D

@onready var pauser = get_node("Pauser")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Pauser").start()
	get_node("World").start(self,pauser)
