extends RigidBody2D

const BULLET_SPEED = 300
const BULLET_PATH = "res://Enemies/Bullet.tscn"

var player_direction = Vector2()
var bullet_counter = 4
var bullet_resource

func _ready():
	bullet_resource = load(BULLET_PATH)
	pass

func _process(delta):
	#player_direction = get_global_mouse_position().normalized()
	pass

func _on_BulletTimer_timeout():
	if bullet_counter < 3:
		var new_bullet = bullet_resource.instance()
		#new_bullet.position = self.global_position
		new_bullet.direction = player_direction
		new_bullet.speed = BULLET_SPEED
		add_child(new_bullet)
		#print(new_bullet.get_instance_id())
		bullet_counter += 1

func _on_BurstTimer_timeout():
		
	player_direction = (get_parent().get_node("Player").position - self.position).normalized()
	#print(player_direction)
	bullet_counter = 0
	pass # replace with function body
