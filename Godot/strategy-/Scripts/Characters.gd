extends CharacterBody2D

@export var speed = 800
var target = Vector2i()

var astar = AStar2D.new()

func _ready():
	return
	
	#astargrid.update()
#@onready var player = $player

func _input(event):
	if event.is_action_pressed("Left mouse"):
		target = get_global_mouse_position()
		
func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		move_and_slide()
