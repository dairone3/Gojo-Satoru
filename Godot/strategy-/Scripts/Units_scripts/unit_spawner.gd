extends Node
@export var unit_scene: PackedScene = preload("res://Scenes/main_unit.tscn")
var N
var unit 
var unit0
var unit1
var unit2
var unit3
var unit4
var unit5
var unit6
var unit7
var unit8 
var unit9 

func _ready() -> void:
	spawn_unit(Vector2(0, 0))
	
	
func spawn_unit(pos: Vector2):
	unit = unit_scene.instantiate() as Main_Unit
	unit.position = pos
	add_child(unit)
	unit.initialise(unit.stats())
	$"../TileMapLayer/UI/PlayerUI/MainUI/TextureRect/hp_bar".setHP(unit.health, unit.stats()["health"])
	$"../TileMapLayer/UI/PlayerUI/MainUI/TextureRect/mp_bar".setMP(unit.move_speed, unit.stats()["move_speed"])
	$"../TileMapLayer/UI/PlayerUI/MainUI/TextureRect/player_icon".activate_icon(unit.stats()["texture"])
	
	print(unit.stats_now())
	unit.health = 29
	print(unit.stats_now())
	unit_move(Vector2(288,144))
	
func unit_move(pos: Vector2):
	print(pos)
	unit.position = pos
