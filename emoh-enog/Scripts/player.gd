extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# defines items nearby
@export var nearby_interactables = []
## Will eventually hold an array 

func _physics_process(_delta: float):
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

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
		pass #if nearby_interactables: 
			#nearby_interactables.back().interact() 
	
	
## Area entered signal connection
func _on_interaction_detector_area_entered(area: Area2D):
	print("stop touching me :(")
	#area.set_active(true) 
	nearby_interactables.append(area)
	##make into an if else statement for the other labels, trying to figure out how
	$Camera2D/InterestLabel.visible = true

## Area exited signal connection 
func _on_interaction_detector_area_exited(area: Area2D):
	print("go away")
	#area.set_active(false) 
	nearby_interactables.erase(area) 
	$Camera2D/InterestLabel.visible = false
	
