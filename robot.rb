class Robot
  @@look = [:NORTH, :EAST, :SOUTH, :WEST]
  attr_accessor :x,
                :y,
                :f

  def initialize(x, y, f)
    @x = x
    @y = y
    @f = f
  end

  def report
    puts "Robot position: #{@x}, #{@y}, #{@f} "
  end

  def rotation command
    index = @@look.index(@f)
    if command == :RIGHT
      index != @@look.length - 1 ? @f = @@look[index + 1] : @f = @@look[0]
    elsif command == :LEFT
      index.zero? ?  @f = @@look[@@look.length - 1] : @f = @@look[index - 1]
    end
  end

  def move
    case @f
    when :NORTH
      @y += 1
    when :EAST
      @x += 1
    when :SOUTH
      @y -= 1
    when :WEST
      @x -= 1
    end
  end
end
