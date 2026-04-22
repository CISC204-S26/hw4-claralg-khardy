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
	if interaction_name == "PoolBookArea":
		print("a pool book!")
		$"../../Player/Camera2D/TextBox/TextBoxColor".visible = true 
		##$Player/Camera2D/TextBox/TextBoxColor/Dialogue.text = "There's a beginner's guide to pool here..."
		
	if interaction_name == "EvilPlant":
		$Player/Camera2D/TextBox/TextBoxColor/Dialogue.text = ""
		$Player/Camera2D/TextBox/TextBoxColor/Dialogue.text = "It tried to bite me..."
		
	if interaction_name == "": 
		$Player/Camera2D/TextBox/TextBoxColor/Dialogue.text = ""
	
		
