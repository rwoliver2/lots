#!/usr/bin/env ruby
#
# Legend of the Sourcerer
# Written by Robert W. Oliver II <robert@cidergrove.com>
# Copyright (C) 2018 Sourcerer, All Rights Reserved.
# Licensed under GPLv3.

module LOTS

class Character
  
  attr_accessor :name
  attr_accessor :health
  attr_accessor :mana
  attr_accessor :x
  attr_accessor :y
  attr_accessor :level
  attr_accessor :str
  attr_accessor :int
  attr_accessor :in_combat

  def initialize (args)
    name = args[:name]
    world = args[:world]
    @name = name
    @level = 1
    @health = 100
    @mana = 100
    @str = 5
    @int = 5
    @x = 1
    @y = world.get_height
    @in_combat = false
    return "Welcome %{name}! Let's play Legend of the Sourcerer!"
  end
	
	def move(args)
    direction = args[:direction]
    world = args[:world]
    ui = args[:ui]
    story = args[:story]
		case direction
		  when :up
			  if @y > 1
					@y -= 1
				else
					ui.out_of_bounds
					return false
				end
			when :down
			  if @y < world.get_height
					@y += 1
				else
					ui.out_of_bounds
					return false
				end
			when :left
			  if @x > 1
					@x -= 1
				else
					ui.out_of_bounds
					return false
				end
			when :right
			  if @x < world.get_width
					@x += 1
				else
					ui.out_of_bounds
					return false
				end
		end
		world.check_area({:player => self, :ui => ui, :story => story})
	end
    
end

end
