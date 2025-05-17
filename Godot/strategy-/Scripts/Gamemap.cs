using Godot;
using System;

public partial class Gamemap : Node2D
{
	[Export]
	public PackedScene TileScene{get;set;}
	[Export]
	public Vector2I Position{get;set;}

	private int height;
	private int width;
	public int[,] TileCoord;
	
	public void CreateTile(Vector2I position) 
	{
		if (TileScene == null)
		{
			GD.PrintErr("TileScene is not set. Please assign it in the editor.");
			return;
		}

		// 1. Instantiate the scene
		// The Instantiate() method returns a generic Node.
		Node TileInstance = TileScene.Instantiate();

		// 2. Add the instance to the current scene
		// You can add it as a child of this node, or any other node in the scene.
		// For example, to add it as a child of the current node:
		AddChild(TileInstance);
		TileCoord = new int[width, height];
		for (int x=0; x<TileCoord.GetLength(0); x++)
		for (int y=0; y<TileCoord.GetLength(1); y++)
		// If you want to add it to the root of the current scene:
		// GetTree().Root.AddChild(TileInstance);
		// Or to the current scene's root node (often preferred):
		// GetTree().CurrentScene.AddChild(TileInstance);

		// 3. Set its properties (e.g., position)
		// You need to cast the instantiated node to its correct type (Node2D, Node3D, or your custom Tile class)
		// to access type-specific properties like Position.

		if (TileInstance is Node2D TileNode2D)
		{
			TileNode2D.Position = position;
			GD.Print($"Spawned Tile (Node2D) at {TileNode2D.Position}");
		}

		else
		{
			GD.PrintErr("Spawned Tile is not a Node2D. Could not set position directly.");
		}
	}
}
