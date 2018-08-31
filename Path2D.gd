extends Path2D

const SPEED = 150

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	$PathFollow2D.offset += SPEED * delta
