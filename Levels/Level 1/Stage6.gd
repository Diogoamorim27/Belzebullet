extends Node

var deaths = 0
signal change_stage

func _ready():
	connect("change_stage", get_parent(), "_stage_changed")
	pass

func _process(delta):
	$Enemy3.RayCast2D.cast_to *= -1
	if deaths == 3:
		emit_signal("change_stage", "game_end")

func _on_Enemy22_died():
	deaths += 1
	pass # replace with function body


func _on_Enemy21_died():
	deaths += 1
	pass # replace with function body


func _on_Enemy1_died():
	deaths += 1
	pass # replace with function body


func _on_Enemy3_died():
	deaths += 1
	pass # replace with function body
