class Triangle
  class TriangleError < StandardError
  end

  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    validate_triangle
  end

  def kind
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    validate_positive_sides
    validate_triangle_inequality
  end

  def validate_positive_sides
    if side1 <= 0 || side2 <= 0 || side3 <= 0
      raise TriangleError, "All sides of a triangle must be larger than 0."
    end
  end

  def validate_triangle_inequality
    if side1 + side2 <= side3 || side2 + side3 <= side1 || side1 + side3 <= side2
      raise TriangleError, "The given sides do not satisfy the triangle inequality."
    end
  end
end
