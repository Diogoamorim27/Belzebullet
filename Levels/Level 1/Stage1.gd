extends Path2D

signal change_stage

func _ready():
	connect("change_stage", get_parent(), "_stage_changed")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Enemy1_died():
	emit_signal("change_stage", "stage2")
	pass # replace with function body
