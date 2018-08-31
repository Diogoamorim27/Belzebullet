extends Position2D

const SPEED = 60

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	self.position += delta*SPEED*Vector2(1,0)
