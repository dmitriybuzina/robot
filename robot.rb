require_relative 'table'

class Robot
  @x
  @y
  @f

  def initialize(x, y, f)
    @x = x
    @y = y
    @f = f
  end

  def move
    case @f
    when :NORTH
    when :EAST
    when :SOUTH
    when :WEST

    end
  end
end