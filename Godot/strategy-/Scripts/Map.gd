extends Node
class Actor:
	pass
	
class Tile:
	var x: int
	var y: int
	#func _ready():
		#self.x = x
		#self.y = y
		
	
	func _init(x: int, y: int):
		pass
		#self.x = x
		#self.y = y
	
	func is_free() -> bool:
		return true
		
	func get_actor() -> Actor:
		return
		
	func set_actor(actor:Actor):
		return 
func _ready() -> void:
	var Coordinates: Array = []
	for y: int in range(5):
		var row = []
		for x:int in range(5):
			row.append(0)
		Coordinates.append(row)

	Coordinates[2][3] = 2
	print(Coordinates)
