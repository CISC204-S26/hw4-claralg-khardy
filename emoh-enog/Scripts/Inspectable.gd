class_name Inspectable extends Area2D

@export var description = ""
@export var has_image = false

## Collision Layer 2 is Interactables :3 -Clara
@export var interaction_name = "test interaction"
@export var interaction_type = "test"
@export var display_active = false
@export var object_ref : Node 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func interact():
	
	##Handles labels and text disappearing 
	if Input.is_action_just_pressed("interact"): 
		$"../../Player/Camera2D/TextBox/TextBoxColor/Dialogue".show() 
		$"../../Player/Camera2D/InterestLabel".hide()

	##Handles interactions with objects
	if interaction_name == "PoolBookArea":
		print("a pool book!")
		$"../../Player/Camera2D/TextBox/TextBoxColor/Dialogue".text = "There's a beginner's guide to pool here..."
	
	if interaction_name == "EvilPlant":
		$Player/Camera2D/TextBox/TextBoxColor/Dialogue.text = "It tried to bite me..."
		
	#if interaction_name == "": 
		#$Player/Camera2D/TextBox/TextBoxColor/Dialogue.text = ""
		
	##Handles taking player from place to place
	if interaction_name == "ToFoyer":
		if Input.is_action_just_pressed("interact"):
			print("going to the foyer!")
			get_tree().change_scene_to_file("res://Scenes/foyer.tscn")
			##$"../Player".position == Vector2(806, 683) 
			##$AnimatedSprite2D.play("IdleUp")
		
	if interaction_name == "ToParlor": 
		if Input.is_action_just_pressed("interact"): 
			print("going to the parlor!")
			get_tree().change_scene_to_file("res://Scenes/parlor.tscn")
			#insert player position here
	
	if interaction_name == "ToLivingSpace": 
		if Input.is_action_just_pressed("interact"): 
			print("going to the living space!")
			get_tree().change_scene_to_file("res://Scenes/living_space.tscn")
			#insert player position here
	
	if interaction_name == "ToGreenhouse": 
		if Input.is_action_just_pressed("interact"): 
			print("going to the greenhouse!")
			get_tree().change_scene_to_file("res://Scenes/Greenhouse.tscn")
			#insert player position here 

	
	##Place key under rug in living space, add arrow to lampshade when turned on to point to key. 
	##Make large picture by the bed an indicator to turn on the lamp. Bookshelf is a red herring. 
	
	##Handles text disappearing after interactions
	await get_tree().create_timer(4).timeout
	$"../../Player/Camera2D/TextBox".visible = false
	
	
	
	
