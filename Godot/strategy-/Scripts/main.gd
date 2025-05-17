extends Node2D

@export var PlayerScene : PackedScene

func _ready():
	for i in GameManager.Players:
		var currentPlayer = PlayerScene.instantiate()
		add_child(currentPlayer)
		print('child name = ',currentPlayer)
		
		
