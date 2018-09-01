extends Path2D

var enemy_1_died = 0
var enemy_2_died = 0

signal change_state

func _ready():
	connect("change_state", get_parent(), "_stage_changed")
	pass

func _process(delta):
	if enemy_1_died and enemy_2_died:
		emit_signal("change_state", "stage3")



func _on_Enemy1_died():
	enemy_1_died = 1
	pass # replace with function body


func _on_Enemy2_died():
	enemy_2_died = 1
	pass # replace with function body
