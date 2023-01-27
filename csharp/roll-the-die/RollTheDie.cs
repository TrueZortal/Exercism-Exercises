using System;

public class Player
{
    public int RollDie()
    {
        var die = new System.Random(18);
        return die.Next(18);
    }

    public double GenerateSpellStrength()
    {
        var die = new System.Random(100);
        return die.NextDouble();
    }
}
