extends RigidBody2D

const BULLET_SPEED = 300
const BULLET_PATH = "res://Enemies/Bullet.tscn"
const VECTOR2_DIRECTIONS = [-1, 0, 1]

var player_direction = Vector2()
var bullet_counter = 0 #4
var bullet_resource
var health = 5

signal died

func _ready():
	bullet_resource = load(BULLET_PATH)
	pass

func _process(delta):
	#print(health)
	#player_direction = get_global_mouse_position().normalized()
	pass

func _on_BulletTimer_timeout():
	if bullet_counter < 25:
		var new_bullet = bullet_resource.instance()
		new_bullet.direction = $RayCast2D.cast_to.normalized()
		new_bullet.speed = BULLET_SPEED
		add_child(new_bullet)
		new_bullet.damage = 100
		bullet_counter += 1

func _on_BurstTimer_timeout():
	bullet_counter = 0
	pass # replace with function body


func _on_Enemy3Area2D_area_entered(object):
	if object.name == "PlayerBulletArea2D":
		health -= object.get_parent().damage
		object.get_parent().queue_free()
		if health <= 0:
			emit_signal("died")
			for child in get_children():
				remove_child(child)
				get_parent().add_child(child)
			self.queue_free()
