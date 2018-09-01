extends KinematicBody2D

const SPEED = 10
const BULLET_PATH = "res://CharacterBullet.tscn"
const BULLET_SPEED = 1000
const BULLET_OFFSET = 32

var motion = Vector2()
var bullet_resource
var can_shoot = true
var health = 100.0
var vidas = 3
var invincible = false

signal shot
signal got_hit(damage)
signal died

func _ready():
	bullet_resource = load(BULLET_PATH)
	pass

func _process(delta):
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
	
	#HANDLE ANIMATION#
	if get_global_mouse_position().x < self.global_position.x:
		$Sprite.flip_h = true
		$RunSpritesheet.flip_h = true
	else:
		$Sprite.flip_h = false
		$RunSpritesheet.flip_h = false
		
	if motion and $AnimationPlayer.current_animation != "Run":
		$AnimationPlayer.play("Run")
	
	
	
func _handle_input(delta):
	var player_direction = Vector2()
	var bullet_direction = Vector2()
	
	
	if !Input.is_action_pressed("motion_key"):
		if ($AnimationPlayer.current_animation != "Idle"):
			$AnimationPlayer.queue("Idle") 
			pass
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
		#$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		player_direction.x = -1
#		speed = min(speed + ACCELERATION, MAX_SPEED)
		#$Sprite.flip_h = true

	if Input.is_action_pressed("mouse_click"):
		if can_shoot == true:
			var new_bullet = bullet_resource.instance()
			new_bullet.direction = get_local_mouse_position().normalized()
			new_bullet.speed = BULLET_SPEED
			new_bullet.position += new_bullet.direction*BULLET_OFFSET
			new_bullet.look_at(get_local_mouse_position())
			add_child(new_bullet)
			new_bullet.damage = 1
			can_shoot = false
			emit_signal("shot")
			
	return player_direction

func _on_ShotTimer_timeout():
	can_shoot = true

func _on_Player_shot():
	var timer = get_node("ShotTimer")
	timer.start()

func _on_Area2D_area_entered(object):
	if not invincible:
		# we got hit by a bullet
		# note: all objects of type bullet have a damage property
		#emit_signal("got_hit", object.get_parent().damage)
		print(object.name)
		
		if object.is_class("RigidBody2D") == true:
			emit_signal("died")

		if get_parent().get_node("CanvasLayer/Control/Lifes").get_child(vidas) != null:
			get_parent().get_node("CanvasLayer/Control/Lifes").get_child(vidas).visible = false
		vidas -= 1 
		if vidas < 0:
			emit_signal("died")
		# destroy the bullet
		object.get_parent().queue_free()
		var invincible_timer = get_node("InvincibilityTimer")
		invincible_timer.start()
		$AnimationInvencibilidade.play("Damage")
		invincible = true
		pass
		
func _on_Player_died():
#	if $AnimationPlayer.current_animation != "Die":
#		$AnimationPlayer.play("Die")
	get_tree().change_scene("res://GameOver.tscn")
	

func _on_KinematicBody2D_tree_exited():
	print("tree exited")
	pass # replace with function body
	
func _on_InvincibilityTimer_timeout():
	invincible = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Die":
		print("Game Over")
		
		