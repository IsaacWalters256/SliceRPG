extends Node2D

#when this move is interupted, it can call force movement during certain moves so you keep going forward or what not
#have different sized ray casts (point them the right way), check the different sizes for how far it can go, if it can go, then go that far in the movement (also can use this for starting the speed out)

@onready var g = get_parent()
var can_change_direction = true

func _ready() -> void:
	get_parent().moves["horz"] = self


func activate():#tell this node that it's the current thing
	if get_parent().direction_facing == 1:
		for c in get_children():
			if c.target_position.x > 0:
				c.target_position.x = c.target_position.x * -1
	elif get_parent().direction_facing == 2:
		for c in get_children():
			if c.target_position.x < 0:
				c.target_position.x = c.target_position.x * -1
	var target = get_node("16")
	if get_node("16").is_colliding():
		target = get_node("8")
		if get_node("8").is_colliding():
			target = get_node("4")
			if get_node("4").is_colliding():
				target = self
	if target != self:
		g.ai.run_ani("move")
		target = get_node("4")
		g.tw = g.pauser.get_tween(g)
		#var rec_frames = g.ai.ani_frame("move")
		#g.ai.sprite.frame_coords = rec_frames[0]
		#g.tw.tween_property(g.ai.sprite,"frame_coords",rec_frames[1],.75)
		g.tw.parallel().tween_property(g,"position",g.position+target.target_position,.15)
		g.tw.tween_callback(self.deactivate)
	else:
		deactivate()

func interupted():#for interupting this thing, disabling it's collisions
	g.tw.kill()

func deactivate():#end of this animation
	g.ani_natural_end()





























#
