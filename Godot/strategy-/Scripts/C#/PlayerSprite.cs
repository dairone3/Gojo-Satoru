using Godot;
using System;
using Strategy.Scripts;

public partial class PlayerSprite : Sprite2D
{
    
    [Export]
    public int Width{get;set;}
    [Export]
    public int Height{get;set;}
    public Vector2I Coord{get;set;}
    public string Name{get;set;}
    public TileSprite Tile{get;set;} 
    
    
    public void SetCoordinatePosition(int x, int y)
    {
        int TileX = x * Width;
        int TileY = y * Height;
        
        Position = new Vector2I(TileX, TileY);
        Coord = new Vector2I(x,y);
    }
    
    public void MoveTo(TileSprite tile)
    {
        if (Tile != null)
        {
            this.Tile.Player = null;
        }
        this.Coord = tile.Cood;
        this.Position = tile.Position;
        this.Tile = tile;
        tile.Player = this;
    }
}
