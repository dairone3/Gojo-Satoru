using Godot;
using System;
using Strategy.Scripts;

public partial class Main : Node2D
{
	[Export]
	public PackedScene TileScene{get;set;}
	[Export]
	public PackedScene Player1Scene{get;set;}
	[Export]
	public PackedScene Player2Scene{get;set;}
	[Export]
	public Vector2 Position{get;set;}
	[Export]
	public int Width{get;set;}
	[Export]
	public int Height{get;set;}
	[Export]
	public Vector2I Player1Position{get;set;}
	[Export]
	public Vector2I Player2Position{get;set;}
	
	
	public override void _Ready()
	{
		App.Map.CreateMap(Width, Height, TileScene,this);
		
		PlayerSprite player1 = App.Map.CreatePlayer(Player1Position.X, Player1Position.Y, Player1Scene, this);
		player1.MoveTo(App.Map.GetTile(Player1Position.X, Player1Position.Y));
		PlayerSprite player2 = App.Map.CreatePlayer(Player2Position.X, Player2Position.Y, Player2Scene, this);
		player2.MoveTo(App.Map.GetTile(Player2Position.X, Player2Position.Y));
		
		App.GameEngine = new GameEngine(player1, player2);
	}
	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
