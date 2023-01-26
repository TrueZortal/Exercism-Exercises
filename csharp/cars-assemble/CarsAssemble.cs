using System;

static class AssemblyLine
{
    public static double SuccessRate(int speed)
    {
        switch(speed)
        {
            case int n when (n <= 4 && n >= 1 ):
                return 1;
            case int n when (n <= 8 && n >= 5 ):
                return 0.9;
            case 9:
                return 0.8;
            case 10:
                return 0.77;
            default:
                return 0;
        }
    }

    public static double ProductionRatePerHour(int speed)
    {
        var rate = 221;
        return (rate * speed) * SuccessRate(speed);
    }

    public static int WorkingItemsPerMinute(int speed)
    {
        return (int) ProductionRatePerHour(speed) / 60;
    }
}
