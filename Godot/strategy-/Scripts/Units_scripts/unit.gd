class_name Unit extends CharacterBody2D

var health: int = 100
var move_speed: int = 1
var evasion: int = 10

var attack1_type: String = "None"
var attack2_type: String = "None"
var damage1: int = 1
var damage2: int = 1
var number_attacks1: int = 1
var number_attacks2: int = 1
var name_attack1: String = "None"
var name_attack2: String = "None"

var texture: String = "None"
var unit_type: String = "None"

func initialise(stats: Dictionary) -> void:
	self.health = stats.get("health")
	self.move_speed = stats.get("move_speed")
	self.evasion = stats.get("evasion")

	self.attack1_type = stats.get("attack1_type")
	self.attack2_type = stats.get("attack2_type")
	self.damage1 = stats.get("damage1")
	self.damage2 = stats.get("damage2")
	self.number_attacks1 = stats.get("number_attacks1")
	self.number_attacks2 = stats.get("number_attacks2")
	self.name_attack1 = stats.get("name_attack1")
	self.name_attack2 = stats.get("name_attack2")

	self.texture = stats.get("texture")
	self.unit_type = stats.get("unit_type")

func stats_now() -> Dictionary:
	return {
		"health": self.health,
		"move_speed": self.move_speed,
		"evasion": self.evasion,

		"attack1_type": self.attack1_type,
		"attack2_type": self.attack2_type,
		"damage1": self.damage1,
		"damage2": self.damage2,
		"number_attacks1": self.number_attacks1,
		"number_attacks2": self.number_attacks2,
		"name_attack1": self.name_attack1,
		"name_attack2": self.name_attack2,

		"texture": self.texture,
		"unit_type": self.unit_type
	}
	
func die(health):
	if health <= 0:
		print("есть пробитие")		
		return true	
	else:
		return false
		
func set_die(unit):
	unit.queue_free()
		
	
func taken_damage(hp: int, damage: int, max_hp: int):
	hp -= damage
	if die(hp) == false:
		print("не почуствовав")
		$TileMapLayer/UI/PlayerUI/MainUI/TextureRect/hp_bar.setHP(hp, max_hp)
		return hp
	else: 
		pass
	
func use_mp(mp:int, cost: int, max_mp):
	mp -= cost
	if mp >= 0:
		$TileMapLayer/UI/PlayerUI/MainUI/TextureRect/mp_bar.setMP(mp, max_mp)		
		return(mp)
	else:
		print ("cant move")

	

	
	
