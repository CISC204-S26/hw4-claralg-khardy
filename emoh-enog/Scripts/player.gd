extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# defines items nearby
@export var nearby_interactables = []
## Will eventually hold an array 

func _physics_process(delta: float):
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	## Handles Movement 
	var directionX := Input.get_axis("walk_left", "walk_right")
	var directionY := Input.get_axis("walk_up", "walk_down")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directionY: 
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
		
		##Handles Sprite Animation
	if Input.is_action_pressed("walk_left"):
		velocity.x -= 1
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("WalkSide")
	if Input.is_action_just_released("walk_left"):
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("IdleSide")
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_pressed("walk_right"):
		velocity.x += 1
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("WalkSide") 
	if Input.is_action_just_released("walk_right"): 
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("IdleSide")
		$AnimatedSprite2D.flip_h = true
	if Input.is_action_pressed("walk_down"):
		velocity.y += 1
		$AnimatedSprite2D.play("WalkDown")
	if Input.is_action_just_released("walk_down"):
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("IdleDown")
	if Input.is_action_pressed("walk_up"):
		velocity.y -= 1
		$AnimatedSprite2D.play("WalkUp")
	if Input.is_action_just_released("walk_up"):
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("IdleUp")

	move_and_slide()
	
	## Handles interactable ability
	if Input.is_action_just_pressed("interact"): 
		if nearby_interactables: 
			nearby_interactables.back().interact() 
	

## Area entered signal connection
func _on_interaction_detector_area_entered(area: Area2D):
	print("stop touching me :(")
	area.set_active(true) 
	nearby_interactables.append(area)

## Area exited signal connection 
func _on_interaction_detector_area_exited(area: Area2D):
	print("go away")
	area.set_active(false) 
	nearby_interactables.erase(area) 
