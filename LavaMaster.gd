extends Node

const LAVA_PATH = "res://Lava.tscn"
const WIDTH = 1920
const HEIGHT = 1080

var lava_resource

func _ready():
	lava_resource = load(LAVA_PATH)
	#state_1()
	#state_2()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func state_1():
	var new_lava = lava_resource.instance()
	new_lava.position = Vector2(0, 0)
	add_child(new_lava)
	var new_lava_2 = lava_resource.instance()
	new_lava_2.position = Vector2(5*(WIDTH/6), 0)
	add_child(new_lava_2)
	var new_lava_3 = lava_resource.instance()
	new_lava_3.position = Vector2(0, 3*(HEIGHT/4))
	add_child(new_lava_3)
	var new_lava_4 = lava_resource.instance()
	new_lava_4.position = Vector2(5*(WIDTH/6), (3*HEIGHT)/4)
	add_child(new_lava_4)
	
func state_2():
	var new_lava_5 = lava_resource.instance()
	new_lava_5.position = Vector2(WIDTH/6, 0)
	add_child(new_lava_5)
	var new_lava_6 = lava_resource.instance()
	new_lava_6.position = Vector2(0, HEIGHT/4)
	add_child(new_lava_6)
	var new_lava_7 = lava_resource.instance()
	new_lava_7.position = Vector2(0, 2*(HEIGHT/4))
	add_child(new_lava_7)
	var new_lava_8 = lava_resource.instance()
	new_lava_8.position = Vector2(WIDTH/6, 3*(HEIGHT/4))
	add_child(new_lava_8)
	var new_lava_9 = lava_resource.instance()
	new_lava_9.position = Vector2(4*(WIDTH/6), 0)
	add_child(new_lava_9)
	var new_lava_10 = lava_resource.instance()
	new_lava_10.position = Vector2(5*(WIDTH/6), (HEIGHT/4))
	add_child(new_lava_10)
	var new_lava_11 = lava_resource.instance()
	new_lava_11.position = Vector2(5*(WIDTH/6), 2*(HEIGHT/4))
	add_child(new_lava_11)
	var new_lava_12 = lava_resource.instance()
	new_lava_12.position = Vector2(4*(WIDTH/6), 3*(HEIGHT/4))
	add_child(new_lava_12)