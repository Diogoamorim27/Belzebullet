extends Sprite

var direction = Vector2()
var speed #= get_parent().BULLET_SPEED

func _ready():
	var new_pos = self.global_position
	set_as_toplevel(true)
	self.position = new_pos
	pass

func _process(delta):
	self.position = self.position + delta*speed*direction