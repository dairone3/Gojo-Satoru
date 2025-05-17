extends Control

@export var Adress = "127.0.0.1"
@export var port = 8910
var peer

func _ready():
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.peer_disconnected.connect(peer_disconnected)
	multiplayer.connected_to_server.connect(connected_to_server)
	multiplayer.connection_failed.connect(connection_failed)
	
	#this get called on the server and clients
func peer_connected(id):
	print("Player Connected " + str(id))
	
	#this get called on the server and clients
func peer_disconnected(id):
	print("Player Disconnected " + str(id))
	
	#this called only from clients
func connected_to_server():
	print("Connected To Server!")
	SendPlayerInformation.rpc_id(1, $LineEdit.text, multiplayer.get_unique_id())
	
	#this called only from clients
func connection_failed(id):
	print("Connection Failed " + (id))
	
@rpc("any_peer")
func SendPlayerInformation(name, id):
	if !GameManager.Players.has(id):
		GameManager.Players[id] = {
			"name" : name,
			"id" : id
			}
	if multiplayer.is_server():
		for i in GameManager.Players:
			SendPlayerInformation.rpc(GameManager.Players[id].name, i)


@rpc("any_peer","call_local")
func StartGame():
	var scene = load("res://Scenes/main.tscn").instantiate()
	get_tree().root.add_child(scene)
	self.hide()
	

func _on_host_button_down() -> void:
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(port, 2)
	if error != OK:
		print("cannot host : ", error)
		return
	#peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	
	multiplayer.set_multiplayer_peer(peer)
	print("Waiting For Players")
	SendPlayerInformation($LineEdit.text, multiplayer.get_unique_id())


func _on_join_button_down() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(Adress, port)
	#peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)


func _on_start_game_button_down() -> void:
	StartGame.rpc()
