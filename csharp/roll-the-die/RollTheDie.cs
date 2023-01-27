using System;

public class Player
{
    public int RollDie()
    {
        var die = new Random(18);
        return die.Next(18);
    }

    public double GenerateSpellStrength()
    {
        var die = new Random(100);
        return die.NextDouble();
    }
}
