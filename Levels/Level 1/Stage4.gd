extends Path2D

signal change_state

var deaths = 0

func _ready():
	connect("change_state", get_parent(), "_stage_changed")
	pass

func _on_Enemy2_died():
	emit_signal("change_state", "stage5")
	pass # replace with function body
