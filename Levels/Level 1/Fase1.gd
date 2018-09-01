extends Node

const STAGE_RESOURCES = ["res://Levels/Level 1/Stage1.tscn",
						"res://Levels/Level 1/Stage2.tscn"]

var current_stage
var stage_resource


func _ready():
	current_stage = $"Stage 1"
	pass

func _stage_changed(new_stage):
	var new_stage_instance
	remove_child(current_stage)
	current_stage.queue_free()
	if new_stage == "stage2":
		print("hallo")
		stage_resource = load(STAGE_RESOURCES[1])
		new_stage_instance = stage_resource.instance()
		add_child(new_stage_instance)
	current_stage = stage_resource
	pass
