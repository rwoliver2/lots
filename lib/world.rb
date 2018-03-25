#!/usr/bin/env ruby
#
# Legend of the Sourcerer
# Written by Robert W. Oliver II <robert@cidergrove.com>
# Copyright (C) 2018 Sourcerer, All Rights Reserved.
# Licensed under GPLv3.

module LOTS

MAP_WIDTH = 64
MAP_HEIGHT = 14

MAP_KEY_TREE      = "\u2618"
MAP_KEY_WATER     = "\u2668"
MAP_KEY_GRASS     = "\u2588"
MAP_KEY_MOUNTAIN  = "\u25B2"
MAP_KEY_ENEMY     = "\u263A"
MAP_KEY_SOURCERER = "\u2658"

MAP_KEY_PLAYER    = "\u1330"

# Weighted
MAP_POSSIBLE_KEYS = [
  MAP_KEY_TREE,
  MAP_KEY_TREE,
  MAP_KEY_TREE,
  MAP_KEY_TREE,
  MAP_KEY_WATER,
  MAP_KEY_GRASS,
  MAP_KEY_MOUNTAIN,
  MAP_KEY_ENEMY
]

# Make grass more common
32.times.each do
  MAP_POSSIBLE_KEYS << MAP_KEY_GRASS
end

class World

  attr_reader :map

  def initialize
    # Set initial world map
    generate_map
    puts map.inspect
  end

  def get_width
    MAP_WIDTH
  end
  
  def get_height
    MAP_HEIGHT
  end
  
  # Return map data in a display format
  def get_map(player)
    buffer = Array.new
    x = 1
    y = 1
    @map.each do |row|
      tmp_row = Array.new
      y = 1
      row.each do |col|
        # If player is here, display them
        if player.x == x and player.y == y
          tmp_row << MAP_KEY_PLAYER.colorize(:color => :light_white, :background => :red)
        else        
        case col
	    when MAP_KEY_TREE
	      tmp_row << col.colorize(:color => :light_green, :background => :green)
        when MAP_KEY_GRASS
	      tmp_row << col.colorize(:color => :green, :background => :green)
	    when MAP_KEY_WATER
	      tmp_row << col.colorize(:color => :white, :background => :blue)
	    when MAP_KEY_MOUNTAIN
	      tmp_row << col.colorize(:color => :yellow, :background => :green)
	    when MAP_KEY_ENEMY
	      tmp_row << col.colorize(:color => :red, :background => :green)
        when MAP_KEY_SOURCERER
          tmp_row << col.colorize(:color => :light_white, :background => :green)
	    end
        end
        y += 1
      end
      buffer << tmp_row
      x += 1
    end
    
    return buffer
  end

  private

  def new_line
    print "\n"
  end

  # Create a random world map
  def generate_map
    tmp_map = Array.new

    # Step through MAX_HEIGHT times
    MAP_HEIGHT.times do
      tmp_row = Array.new
      MAP_WIDTH.times do
        tmp_row << MAP_POSSIBLE_KEYS.sample
      end

      # Add our assembled row to the map
      tmp_map << tmp_row
      tmp_row = nil
    end
    @map = tmp_map

    # Place Sourcerer
    #@map[MAP_WIDTH, 0] = MAP_KEY_SOURCERER
  end

end
end
