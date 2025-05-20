using Godot;

namespace Strategy.Scripts;

public class GameEngine 
{
    public PlayerSprite Player1;
    // public PlayerSprite Player2;
    // public bool IsPlayer1Turn = true;
    
    public GameEngine(PlayerSprite player1)
    {
        this.Player1 = player1;
        // this.Player2 = player2;
    }
    
    public void MovePlayer(TileSprite tile)
    {
        if (tile.IsFree() == false)
        {
            GD.Print("Occupied");
            return;
        }

        this.Player1.MoveTo(tile);
        // if (IsPlayer1Turn)
        // {
        //     this.Player1.MoveTo(tile);
        //     IsPlayer1Turn = false;
        // }
        // else
        // {
        //     this.Player2.MoveTo(tile);
        //     IsPlayer1Turn = true;
        // }
    }
}