class Robot
  attr_accessor :x, :y, :f

  @@look = %i[NORTH EAST SOUTH WEST]

  def initialize(x, y, f)
    @x = x
    @y = y
    @f = f
  end

  def report
    puts "Robot position: #{@x}, #{@y}, #{@f} "
  end

  def rotation(command)
    index = @@look.index(@f)
    if command == :RIGHT
      @f = index != @@look.length - 1 ? @@look[ index + 1 ] : @@look[0]
    elsif command == :LEFT
      @f = @@look[ index - 1 ]
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
