extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("walk_left", "walk_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
		##Handles Sprite Animation
	if Input.is_action_pressed("walk_left"):
		$AnimatedSprite2D.play("WalkLeft")
	if Input.is_action_just_released("walk_left"):
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("IdleLeft")
	if Input.is_action_pressed("walk_down"):
		$AnimatedSprite2D.play("WalkDown")
	if Input.is_action_just_released("walk_down"):
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("IdleDown")
	if Input.is_action_pressed("walk_up"):
		$AnimatedSprite2D.play("WalkUp")
	if Input.is_action_just_released("walk_up"):
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("IdleUp")

	move_and_slide()
