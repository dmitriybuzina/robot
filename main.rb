require_relative 'table'
require_relative 'robot'

class Main

  def start
    puts '1 - write size of table, else - default'
    if gets.chomp == '1'
      puts 'Write height:'
      height = gets.chomp.to_i
      puts 'Write width:'
      width = gets.chomp.to_i
      @table = Table.new(height, width)
    else
      @table = Table.new(5, 6)
    end
    puts 'Write command'
    command = gets.chomp.to_s
    if command.include? 'PLACE'
      x = command[6]
      y = command[8]
      f = command[10]
      @robot = Robot.new(x,y,f)
    else
      case command.to_sym
      when :MOVE

      when :LEFT

      when :RIGHT

      when :REPORT
      end
    end
  end

  def read
    puts 'Write path of file'
    @array_commands = []
    File.open(gets.chomp , 'r').each { |line| @array_commands << line }
    res = 0
  end
end

main = Main.new
main.read