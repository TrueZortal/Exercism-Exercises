# require "Math"

class ComplexNumber

  attr_reader :real, :imaginary

  def initialize(real, imaginary)
    @real = real
    @imaginary = imaginary
  end

  def *(other)
    a = @real * other.real - @imaginary * other.imaginary
    b = @imaginary * other.real + @real * other.imaginary
    ComplexNumber.new(a, b)
  end

  def /(other)
    a = (@real * other.real + @imaginary * other.imaginary)/(other.real^2 + other.imaginary^2)
    b = (@imaginary * other.real + @real * other.imaginary)/(other.real^2 + other.imaginary^2)
    ComplexNumber.new(a, b)
  end

  def +(other)
    ComplexNumber.new(@real + other.real, @imaginary + other.imaginary)
  end

  def conjugate
   a = @real
   b = -@imaginary
   ComplexNumber.new(a, b)
  end

  def abs
    a = @real^2
    b = @imaginary^2
    ComplexNumber.new(a, b)
  end

  def exp
    a = Math.exp(@real)
    b = Math.exp((-1)**2 * @imaginary)
    ComplexNumber.new(a, b)
  end

  def -(other)
    a = @real - other.real
    b = @imaginary - other.imaginary
    ComplexNumber.new(a, b)
  end

  def ==(other)
    real = other.real &&  imaginary = other.imaginary
  end

end
