extends Node2D

@onready var g = get_parent()
var can_change_direction = true

func _ready() -> void:
	get_parent().moves["tile_jump"] = self

func activate():#tell this node that it's the current thing
	g.tw = g.pauser.get_tween(g)
	#var rec_frames = g.ai.ani_frame("idle")
	#g.ai.sprite.frame_coords = rec_frames[0]
	#g.tw.tween_property(g.ai.sprite,"frame_coords",rec_frames[1],1)
	g.ai.run_ani("idle")
	g.tw.tween_callback(self.deactivate).set_delay(1)

func interupted():#for interupting this thing, disabling it's collisions
	pass

func deactivate():#end of this animation
	g.ani_natural_end()
