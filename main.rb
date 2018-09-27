require_relative 'robot'

class Main
  def start
    puts '1 - write size of table, else - default'
    if gets.chomp == '1'
      puts 'write height:'
      @table_height = gets.chomp.to_i
      puts 'write width:'
      @table_width = gets.chomp.to_i
    else
      @table_height = 5
      @table_width = 6
    end
    read
    parse
  end

  def read
    puts 'write path of file'
    @array_commands = []
    File.open(gets.chomp, 'r').each { |line| @array_commands << line }
  end

  def check
    return false if @robot.x == @table_width.to_i - 1 && @robot.f == :EAST
    return false if @robot.x.zero? && @robot.f == :WEST
    return false if @robot.y.to_i == @table_height - 1 && @robot.f == :NORTH
    return false if @robot.y.zero? && @robot.f == :SOUTH

    true
  end

  def parse
    flag = false
    @array_commands.each_index do |i|
      if @array_commands[i].include? 'PLACE'
        item = @array_commands[i].split(/\W+/)
        if item[1].to_i < @table_width && item[2].to_i < @table_height && item[1].to_i >= 0 && item[2].to_i >= 0
          @robot = Robot.new(item[1].to_i, item[2].to_i, item[3].to_sym)
          flag = true
        end
      elsif flag
        case @array_commands[i].chomp.to_sym
        when :MOVE
          @robot.move if check
        when :RIGHT
          @robot.rotation :RIGHT
        when :LEFT
          @robot.rotation :LEFT
        when :REPORT
          @robot.report
        end
      end
    end
  end
end

main = Main.new
main.start
