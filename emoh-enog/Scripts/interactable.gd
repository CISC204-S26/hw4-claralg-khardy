class_name Interactable extends Area2D

## Collision Layer 2 is Interactables :3 -Clara
@export var interaction_name = "test interaction"
@export var interaction_type = "test"
@export var display_active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func interact():
	push_warning("this interactable has no interact() code yet!")
	if interaction_name == "PoolBook":
		$Player/TextBox/TextBoxColor.show()
		$Player/TextBox/TextBoxColor/Dialogue.text = ""
		$Player/TextBox/TextBoxColor/Dialogue.text = "There's a beginner's guide to pool here..."
		
