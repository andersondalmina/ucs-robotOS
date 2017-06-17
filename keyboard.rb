require 'ruby2d'
require 'ffi'

set diagnostics: true

module Driver
  extend FFI::Library

  ffi_lib 'driver/acesso.so'
  attach_function :writeDriver, [ :string ], :int
end

# config window
set title: 'Robot'
set width: 200, height: 200

Triangle.new(x1: 15, y1: 100, x2: 60, y2: 70, x3: 60, y3: 130, color: 'red')
Triangle.new(x1: 100, y1: 15, x2: 70, y2: 60, x3: 130, y3: 60, color: 'red')
Triangle.new(x1: 185, y1: 100, x2: 140, y2: 70, x3: 140, y3: 130, color: 'red')
Triangle.new(x1: 100, y1: 185, x2: 70, y2: 140, x3: 130, y3: 140, color: 'red')

on :key do |event|
  case event.key
  when 'up'
    Driver.writeDriver('up')
  when 'down'
    Driver.writeDriver('down')
  when 'left'
    Driver.writeDriver('left')
  when 'right'
    Driver.writeDriver('right')
  end
end

show
