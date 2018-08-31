extends KinematicBody2D

const SPEED = 10
const BULLET_PATH = "res://Enemies/Bullet.tscn"
const BULLET_SPEED = 1000

var motion = Vector2()
var bullet_resource
var can_shoot = true
var health = 100.0
var vidas = 3

signal shot
signal got_hit(damage)
signal died

func _ready():
	bullet_resource = load(BULLET_PATH)
	pass

func _process(delta):
	print("health = ", health)
	var direction = Vector2()
	motion = Vector2(0, 0)
	direction = _handle_input(delta)
	if direction == Vector2(0, 0):
		motion.x = lerp(motion.x, 0, 0.01)
		motion.y = lerp(motion.y, 0, 0.01)
	else:
		motion = direction.normalized() * SPEED
	move_and_collide(motion)
	position.x = clamp(position.x, 0, 1872)
	position.y = clamp(position.y, 32, 1050)
	
func _handle_input(delta):
	var player_direction = Vector2()
	var bullet_direction = Vector2()
	
	if !Input.is_action_pressed("motion_key"):
		player_direction = Vector2()
	if Input.is_action_pressed("ui_up"):
		player_direction.y = -1
#		speed = min(speed + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_down"):
		player_direction.y = 1
#		speed = min(speed + ACCELERATION, MAX_SPEED)
	if Input.is_action_pressed("ui_right"):
		player_direction.x = 1
#		speed = min(speed + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		player_direction.x = -1
#		speed = min(speed + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = true

	if Input.is_action_pressed("mouse_click"):
		if can_shoot == true:
			var new_bullet = bullet_resource.instance()
			new_bullet.direction = get_local_mouse_position().normalized()
			new_bullet.speed = BULLET_SPEED
			add_child(new_bullet)
			new_bullet.damage = 0
			can_shoot = false
			emit_signal("shot")
			
	return player_direction

func _on_ShotTimer_timeout():
	can_shoot = true

func _on_Player_shot():
	var timer = get_node("ShotTimer")
	timer.start()

func _on_Area2D_area_entered(object):
	# we got hit by a bullet
	# note: all objects of type bullet have a damage property
	emit_signal("got_hit", object.get_parent().damage)
	print("got hit")
	health -= object.get_parent().damage

	if health < 0:
		get_parent().get_node("CanvasLayer/Control/Lifes").get_child(vidas).visible = false
		vidas -= 1 
		health = 100
		if vidas < 0:
			emit_signal("died")
    # destroy the bullet
	object.queue_free()

func _on_Player_died():
	print("GAME OVER!!!!")
	self.queue_free()