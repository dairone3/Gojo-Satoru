using Godot;
using System;

public partial class MultiplayerController : Control
{
	[Export]
	private int port = 8910;
	[Export]
	private string address = "127.0.0.1";

	private ENetMultiplayerPeer peer;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Multiplayer.PeerConnected += PeerConnected;
		Multiplayer.PeerDisconnected += PeerDisconnected;
		Multiplayer.ConnectedToServer += ConnectedToServer;
		Multiplayer.ConnectionFailed += ConnectionFailed;
	}
	// runs when Connection fails only on the client 
	private void ConnectionFailed()
	{
		GD.Print("Connection failed");
	}
	// runs when connection successful only on the client
	private void ConnectedToServer()
	{
		GD.Print("Connected to server");
	}
	// runs when player disconnects on all peers
	// id = id of the player who disconnects
	private void PeerDisconnected(long id)
	{
		GD.Print("Peer disconnected" + id.ToString());
	}
	// runs when player connects on all peers
	// id = id of the player who connects
	private void PeerConnected(long id)
	{
		GD.Print("Peer connected" + id.ToString());
	}
	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void _on_host_button_down()
	{
		peer = new ENetMultiplayerPeer();
		var error = peer.CreateServer(port, 2);
		if (error != Error.Ok)
		{
			GD.Print("error cannot host :" + error.ToString());
			return;
		}
		peer.Host.Compress(ENetConnection.CompressionMode.RangeCoder);
		Multiplayer.MultiplayerPeer = peer;
		GD.Print("Waiting for players");
	}

	public void _on_join_button_down()
	{
		peer = new ENetMultiplayerPeer();
		peer.CreateClient(address, port);
		
		peer.Host.Compress(ENetConnection.CompressionMode.RangeCoder);
		Multiplayer.MultiplayerPeer = peer;
		GD.Print("Joining game"); 
	}

	public void _on_start_game_button_down()
	{
		
	}
}
