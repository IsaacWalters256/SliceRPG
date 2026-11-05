extends Node2D

var pause_locked = false
var paused = false
var mega_tween = {
	
}

func end():
	for mt in mega_tween:
		mega_tween[mt].kill()
		mega_tween.erase(mt)

func get_tween(node_creating,index=0):
	var id = str(node_creating) + str(index)
	if mega_tween.has(id):
		if mega_tween[id]:
			mega_tween[id].kill()
	mega_tween[id] = get_tree().create_tween()
	return mega_tween[id]


func pause_all(is_pausing):
	
	paused = is_pausing
	
	set_pause_subtree(get_parent().get_node("OtherMain"), paused)
	
	if paused:
		get_parent().get_node("MouseFollow").visible = true
		for m in mega_tween:
			mega_tween[m].pause()
	else:
		get_parent().get_node("MouseFollow").visible = false
		for m in mega_tween:
			mega_tween[m].play()

func set_pause_subtree(root: Node, pause: bool) -> void: #from godot docs forum
	var process_setters = ["set_process", "set_physics_process", "set_process_input", "set_process_unhandled_input", "set_process_unhandled_key_input", "set_process_shortcut_input",]
	for setter in process_setters:
		root.propagate_call(setter, [!pause])





var ticker


func start():
	play_ticker()

func play_ticker():
	ticker = self.get_tween(self)
	ticker.tween_callback(self.run_ani_step).set_delay(0.25)#here would be haste
	ticker.tween_callback(self.play_ticker)

func run_ani_step():
	for k in get_parent().get_node("World").animation_list:
		var cup = get_parent().get_node("World").animation_list[k]
		if cup.anis.has(cup.current_ani[1]):
			if cup.current_ani[0] == cup.anis[cup.current_ani[1]].size():
				cup.current_ani[0] = 0
				cup.ani_ended()
			
			if cup.anis[cup.current_ani[1]][cup.current_ani[0]].has("f"):
				cup.main_sprite.frame = cup.anis[cup.current_ani[1]][cup.current_ani[0]]["f"]
			elif cup.anis[cup.current_ani[1]][cup.current_ani[0]].has("fc"):
				if cup.anis[cup.current_ani[1]][cup.current_ani[0]]["fc"].y is int:
					cup.main_sprite.frame_coords = cup.anis[cup.current_ani[1]][cup.current_ani[0]]["fc"]
				else:
					cup.main_sprite.frame_coords = Vector2(cup.anis[cup.current_ani[1]][cup.current_ani[0]]["fc"][0],cup.anis[cup.current_ani[1]][cup.current_ani[0]]["fc"][1]-0.01+cup.moves["direction"].direction_facing)
			
			if cup.moves.has("horz"):
				cup.moves["horz"].move_tick()
			
			#if cup.anis[cup.current_ani[1]][cup.current_ani[0]].has("move"):
			#	cup.move_direction(cup.anis[cup.current_ani[1]][cup.current_ani[0]]["move"])
			
			
			cup.current_ani[0] = cup.current_ani[0] + 1
			if cup.current_ani[0] == cup.anis[cup.current_ani[1]].size():
				cup.ani_ended()
