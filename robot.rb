class Robot
  attr_accessor :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def walk(x:, y:)
    @x = x
    @y = y
  end

  def draw
    robot = Image.new(x: @x, y: @y, path: 'assets/robot.png', z: 2)
    robot.width = 75
    robot.height = 60

    robot
  end
end
