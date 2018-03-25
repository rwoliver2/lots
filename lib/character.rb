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
  
  def initialize (name, world_details)
    @name = name
    @level = 1
    @health = 100
    @mana = 100
    @str = 5
    @int = 5
    @x, @y = place_character(world_details[:width], world_details[:height])
    return "Welcome %{name}! Let's play Legend of the Sourcerer!"
  end
  
  private
  
  def place_character(width, height)
    return height, 1
  end
    
end

end
