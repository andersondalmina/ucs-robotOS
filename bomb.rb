class Bomb
  attr_accessor :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def draw
    bomb = Image.new(x: @x, y: @y, path: 'assets/bomb.png', z: 1)
    bomb.width = 30
    bomb.height = 40

    puts bomb
  end
end
