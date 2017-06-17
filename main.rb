# import gem and C library
require 'ruby2d'
require 'ffi'

# import classes
require_relative 'robot'
require_relative 'bomb'

set diagnostics: true

module Driver
  extend FFI::Library

  ffi_lib 'driver/acesso.so'
  attach_function :readDriver, [], :char
end

# config window
set title: 'Robot'
set width: 800, height: 600
set background: '#1A1A1A'

music = Music.new('assets/song.mp3')
music.play
music.loop = true

robot = Robot.new(x: 200, y: 10)
bombs = []

update do
  sleep 1
  clear

  robot.draw

  bombs << Bomb.new(x: rand(720), y: rand(720)) if (rand(1000) % 333).zero?

  bombs.each(&:draw)

  puts "Retorno #{Driver.readDriver}"
end

show
