extends Node2D


#set theses to area 2?
#looking at the forward movement spot, if there is an area there, dont allow the player to move that way

var avaliable_directions = [true,true,true,true]#front, left, right, back


func _on_front_area_entered(area: Area2D) -> void:
	avaliable_directions[0] = false

func _on_front_area_exited(area: Area2D) -> void:
	avaliable_directions[0] = true


func _on_left_area_entered(area: Area2D) -> void:
	avaliable_directions[1] = false

func _on_left_area_exited(area: Area2D) -> void:
	avaliable_directions[1] = true


func _on_right_area_entered(area: Area2D) -> void:
	avaliable_directions[2] = false

func _on_right_area_exited(area: Area2D) -> void:
	avaliable_directions[2] = true


func _on_back_area_entered(area: Area2D) -> void:
	avaliable_directions[3] = false

func _on_back_area_exited(area: Area2D) -> void:
	avaliable_directions[3] = true
