extends CharacterBody2D



func _ready():
	$MultiplayerSynchronizer.set_multiplayer_authority(str(name).to_int())
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		if $MultiplayerSynchronizer.get_multiplayer_authority() == multiplayer.get_unique_id():
			position = get_global_mouse_position()


func _physics_process(_delta):
	pass
	
