using Godot;
using System;

public partial class Sprite2d : Sprite2D
{
    public class Tile(int x, int y)
    {
        private int x;
        private int y;

        public bool IsFree()
        {
            return true;
        }
        
        
    }

    public override void _Ready()
    {
        int[] matrix = new int[9];
        for (int i = 0; i < 9; i++)
        {
            matrix[i] = 0;
            Console.WriteLine(matrix);
        }
        this.MoveLocalX(delta:1);
        
    }
}
