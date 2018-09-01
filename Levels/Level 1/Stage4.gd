extends Node

var deaths = 0
signal change_stage

func _ready():
	connect("change_stage", get_parent(), "_stage_changed")
	pass

func _process(delta):
	if deaths == 3:
		#print("should change state")
		emit_signal("change_stage", "stage5")


func _on_Enemy1_died():
	deaths +=1
	pass # replace with function body


func _on_Enemy2_died():
	deaths +=1
	pass # replace with function body


func _on_Enemy3_died():
	deaths +=1
	pass # replace with function body
