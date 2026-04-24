extends Node

@export var right_room_unlocked = false
@export var greenhouse_unlocked = false
@export var safe_code = false
@export var safe_opened = false
@export var key_obtained = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if safe_code == true and key_obtained == true:
		##Input second sprite for safe.
		if Input.is_action_just_pressed("interact"):
			$Player/Camera2D/TextBox/TextBoxColor/Dialogue.text == "It's already opened, I got the key from inside"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
