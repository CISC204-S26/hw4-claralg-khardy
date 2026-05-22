class_name Transition extends Area2D

@export var unlocked = false

@export var interaction_name = "test interaction"
@export var interaction_type = "test"
@export var display_active = false
@export var object_ref : Node 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if interaction_name == "ToFoyer":
		hide()
	
	if interaction_name == "ToLivingSpace": 
		hide()
	
	if interaction_name == "ToGreenhouse": 
		hide()
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	

func transition():
	
	##Handles taking player from place to place
	if interaction_name == "ToFoyer":
		if Input.is_action_just_pressed("interact"):
			print("going to the foyer!")
			get_tree().change_scene_to_file("res://Scenes/foyer.tscn")
		
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
