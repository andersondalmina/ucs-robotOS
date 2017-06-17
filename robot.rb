class Robot
  attr_accessor :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def walk(string)
    case string
    when 'u'
      @y -= 2
    when 'd'
      @y += 2
    when 'l'
      @x -= 2
    when 'r'
      @x += 2
    end
  end

  def draw
    robot = Image.new(x: @x, y: @y, path: 'assets/robot.png', z: 2)
    robot.width = 75
    robot.height = 60

    robot
  end

  def hasBomb(bomb)
    right = @x
    left = @x + 75
    up = @y
    down = @y + 60

    if (left >= bomb.x && left <= bomb.x + 35)
      if (up >= bomb.y && up <= bomb.y + 40)
        return true
      end

      if (down >= bomb.y && down <= bomb.y + 40)
        return true
      end
    end

    if (right >= bomb.x && right <= bomb.x + 35)
      if (up >= bomb.y && up <= bomb.y + 40)
        return true
      end

      if (down >= bomb.y && down <= bomb.y + 40)
        return true
      end
    end
  end
end
