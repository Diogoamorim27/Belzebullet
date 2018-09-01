extends Node

const STAGE_RESOURCES = ["res://Levels/Level 1/Stage1.tscn",
						"res://Levels/Level 1/Stage2.tscn",
						"res://Levels/Level 1/Stage3.tscn",
						"res://Levels/Level 1/Stage4.tscn",
						"res://Levels/Level 1/Stage5.tscn",
						"res://Levels/Level 1/Stage6.tscn"]


var current_stage
var stage_resource


func _ready():
	current_stage = $"Stage 1"
	pass

func _stage_changed(new_stage):
	print(new_stage)
	var new_stage_instance
	remove_child(current_stage)
	current_stage.queue_free()
	if new_stage == "stage2":
		stage_resource = load(STAGE_RESOURCES[1])
	elif new_stage == "stage3":
		stage_resource = load(STAGE_RESOURCES[2])
	elif new_stage == "stage4":
		stage_resource = load(STAGE_RESOURCES[3])
	elif new_stage == "stage5":
		stage_resource = load(STAGE_RESOURCES[4])
		$LavaControl.state_1()
	elif new_stage == "stage6":
		stage_resource = load(STAGE_RESOURCES[5])
		$LavaControl.state_2()
	elif new_stage == "game_end":
		get_tree().change_scene("res://Levels/Level 1/FinalScene.tscn")
	new_stage_instance = stage_resource.instance()
	add_child(new_stage_instance)
	current_stage = new_stage_instance
	pass
