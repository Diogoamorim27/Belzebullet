extends RigidBody2D

const BULLET_SPEED = 300
const BULLET_PATH = "res://Enemies/Bullet.tscn"

var player_direction = Vector2()
var bullet_counter = 4
var bullet_resource
var health = 7

signal died

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
		get_parent().add_child(new_bullet)
		#print(new_bullet.get_instance_id())
		bullet_counter += 1

func _on_BurstTimer_timeout():
	player_direction = (get_owner().get_node("Player").position - self.global_position).normalized()
	#print(player_direction)
	bullet_counter = 0
	pass # replace with function body


func _on_Enemy1Area2D_area_entered(object):
	if object.name == "PlayerBulletArea2D":
		health -= object.get_parent().damage
		#print(object.get_parent().name)
		object.get_parent().queue_free()
		if health <= 0:
#			for child in get_children():
#				remove_child(child)
#				get_parent().get_parent().add_child(child)
			emit_signal("died")
			self.queue_free()