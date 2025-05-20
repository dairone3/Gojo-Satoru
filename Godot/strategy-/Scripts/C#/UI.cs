using Godot;
using System;
using Strategy.Scripts;

public partial class UI : Node
{
	[Export] public Label TurnLabel;
	// public override void _Process(double delta)
	// {
	// 	if (App.GameEngine.IsPlayer1Turn == true)
	// 	{
	// 		TurnLabel.Text = "Red";
	// 		TurnLabel.AddThemeColorOverride("font_color",new Color(1,0,0));
	// 	}
	// 	else
	// 	{
	// 		TurnLabel.Text = "Blue";
	// 		TurnLabel.AddThemeColorOverride("font_color",new Color(0,0,1));
	// 	}
	// }
}
