class Lasagna
{
  public int ExpectedMinutesInOven() {
   return 40;
  }

  public int RemainingMinutesInOven(int time) {
      return ExpectedMinutesInOven() - time;
  }


  public int PreparationTimeInMinutes(int layers) {
      return layers * 2;
  }

  public int ElapsedTimeInMinutes(int layers, int time){
      return PreparationTimeInMinutes(layers) + time;
  }
}
