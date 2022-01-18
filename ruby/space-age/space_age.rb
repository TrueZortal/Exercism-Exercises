# frozen_string_literal: true

class SpaceAge

EARTH_YEAR = 31_557_600
MODIFIERS = {
  earth: 1,
  mercury: 0.2408467,
  venus: 0.61519726,
  mars: 1.8808158,
  jupiter: 11.862615,
  saturn: 29.447498,
  uranus: 84.016846,
  neptune: 164.79132
}

  def initialize(given_input)
    @seconds = given_input
  end

  MODIFIERS.each do |planet, orbit|
    define_method ('on_'+ planet.to_s) do
      @seconds.to_f / (EARTH_YEAR * orbit)
    end
  end
end
