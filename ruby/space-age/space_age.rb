class SpaceAge
  def initialize(given_input)
    earth_year_in_seconds = 31557600
    @earth_years = given_input/earth_year_in_seconds.to_f
  end
  def on_mercury
    modifier = 0.2408467
    @earth_years / modifier
  end
  def on_venus
    modifier = 0.61519726
    @earth_years / modifier
  end
  def on_earth()
    @earth_years
  end
  def on_mars
    modifier = 1.8808158
    @earth_years / modifier
  end
  def on_jupiter
    modifier = 11.862615
    @earth_years / modifier
  end
  def on_saturn
    modifier = 29.447498
    @earth_years / modifier
  end
  def on_uranus
    modifier = 84.016846
    @earth_years / modifier
  end
  def on_neptune
    modifier = 164.79132
    @earth_years / modifier
  end
end
