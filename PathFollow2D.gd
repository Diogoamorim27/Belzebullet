extends PathFollow2D

const SPEED = 100
var stage2 = false

func _ready():

	pass

func _process(delta):
	self.offset += SPEED*delta


func _on_Enemy1_died():
	#kraaaaa
	pass # replace with function body