extends Path2D

signal change_state

var deaths = 0

func _ready():
	connect("change_state", get_parent(), "_stage_changed")
	pass

func _process(delta):
	if deaths == 3:
		emit_signal("change_state", "stage4")



func _on_Enemy1_died():
	deaths +=1
	pass # replace with function body


func _on_Enemy3_died():
	deaths +=1
	pass # replace with function body


func _on_Enemy2_died():
	deaths += 1
	pass # replace with function body
