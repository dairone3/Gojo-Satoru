using Godot;
using System;

public partial class Main : Node2D
{
	[Export]
	public PackedScene TileScene{get;set;}
	[Export]
	public Vector2 Position{get;set;}
	[Export]
	public int width{get;set;}
	[Export]
	public int height{get;set;}
	// Called when the node enters the scene tree for the first time.
	
	public override void _Ready()
	{
		GD.Print("Tile");
		for (int h = 0; h < height; h++)
		{
			for (int w = 0; w < width; w++)
			{
				SpawnSpire(new Vector2(Position.X + 72 * w, Position.Y + 72 * h));
			}
		}
		// SpawnSpire(Position);
		// SpawnSpire(new Vector2(Position.X + 128, Position.Y + 128));
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	public void SpawnSpire(Vector2 position) 
	{
		if (TileScene == null)
		{
			GD.PrintErr("TileScene is not set. Please assign it in the editor.");
			return;
		}

		// 1. Instantiate the scene
		// The Instantiate() method returns a generic Node.
		Node spireInstance = TileScene.Instantiate();

		// 2. Add the instance to the current scene
		// You can add it as a child of this node, or any other node in the scene.
		// For example, to add it as a child of the current node:
		AddChild(spireInstance);

		// If you want to add it to the root of the current scene:
		// GetTree().Root.AddChild(spireInstance);
		// Or to the current scene's root node (often preferred):
		// GetTree().CurrentScene.AddChild(spireInstance);

		// 3. Set its properties (e.g., position)
		// You need to cast the instantiated node to its correct type (Node2D, Node3D, or your custom Spire class)
		// to access type-specific properties like Position.

		if (spireInstance is Node2D spireNode2D)
		{
			spireNode2D.Position = position;
			GD.Print($"Spawned Spire (Node2D) at {spireNode2D.Position}");
		}

		else
		{
			GD.PrintErr("Spawned spire is not a Node2D. Could not set position directly.");
		}
	}
}
