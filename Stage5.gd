extends Node

var deaths = 0

signal change_state

func _ready():
	connect("change_state", get_parent(), "_stage_changed")

func _process(delta):
	if deaths == 3:
		pass


func _on_Enemy2_died():
	deaths +=1
	pass # replace with function body


func _on_Enemy1_died():
	deaths += 1
	pass # replace with function body


func _on_Enemy3_died():
	deaths +=1
	pass # replace with function body
