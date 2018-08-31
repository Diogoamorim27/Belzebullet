extends RigidBody2D

const BULLET_SPEED = 300
const BULLET_PATH = "res://Enemies/Bullet.tscn"
const VECTOR2_DIRECTIONS = [-1, 0, 1]

var player_direction = Vector2()
var bullet_counter = 0 #4
var bullet_resource

func _ready():
	bullet_resource = load(BULLET_PATH)
	pass

func _process(delta):
	#player_direction = get_global_mouse_position().normalized()
	pass

func _on_BulletTimer_timeout():
	if bullet_counter < 3:
		for direction_x in VECTOR2_DIRECTIONS:
			for direction_y in VECTOR2_DIRECTIONS:
				if (direction_x or direction_y):
					var new_bullet = bullet_resource.instance()
					new_bullet.direction = Vector2(direction_x, direction_y).normalized()
					new_bullet.speed = BULLET_SPEED
					add_child(new_bullet)
		bullet_counter += 1

func _on_BurstTimer_timeout():
	bullet_counter = 0
	pass # replace with function body
