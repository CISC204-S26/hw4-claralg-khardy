class_name Inspectable extends Interactable

@export var description = ""
@export var has_image = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func interact():
	
	##Handles taking player from place to place
	if interaction_name == "ParlorToFoyer":
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Scenes/foyer.tscn")
			#$"../../Player".position == 
		
	if interaction_name == "FoyerToParlor": 
		if Input.is_action_just_pressed("interact"): 
			get_tree().change_scene_to_file("res://Scenes/parlor.tscn")
			#insert player position here
	
	if interaction_name == "LivingSpaceToFoyer": 
		if Input.is_action_just_pressed("interact"): 
			get_tree().change_scene_to_file("res://Scenes/foyer.tscn")
			#insert player position here
	
	if interaction_name == "FoyerToLivingSpace": 
		if Input.is_action_just_pressed("interact"): 
			get_tree().change_scene_to_file("res://Scenes/living_space.tscn")
			#insert player position here
	
	if interaction_name == "GreenhouseToFoyer": 
		if Input.is_action_just_pressed("interact"): 
			get_tree().change_scene_to_file("res://Scenes/foyer.tscn")
			#insert player position here
	
	if interaction_name == "FoyerToGreenhouse": 
		if Input.is_action_just_pressed("interact"): 
			get_tree().change_scene_to_file("res://Scenes/Greenhouse.tscn")
			#insert player position here 
	
	##Handles labels and text disappearing 
	if Input.is_action_just_pressed("interact"): 
		$"../../Player/Camera2D/TextBox/TextBoxColor".visible = true 
		$"../../Player/Camera2D/InterestLabel".visible = false

	##Handles interactions with objects
	if interaction_name == "PoolBookArea":
		print("a pool book!")
		$"../../Player/Camera2D/TextBox/TextBoxColor/Dialogue".text = "There's a beginner's guide to pool here..."
	
	if interaction_name == "EvilPlant":
		$Player/Camera2D/TextBox/TextBoxColor/Dialogue.text = "It tried to bite me..."
		
	#if interaction_name == "": 
		#$Player/Camera2D/TextBox/TextBoxColor/Dialogue.text = ""
	
	##Place key under rug in living space, add arrow to lampshade when turned on to point to key. 
	##Make large picture by the bed an indicator to turn on the lamp. Bookshelf is a red herring. 
	
	##Handles text disappearing after interactions
	await get_tree().create_timer(4).timeout
	$"../../Player/Camera2D/TextBox".visible = false
