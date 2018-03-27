#!/usr/bin/env ruby
#
# Legend of the Sourcerer
# Written by Robert W. Oliver II <robert@cidergrove.com>
# Copyright (C) 2018 Sourcerer, All Rights Reserved.
# Licensed under GPLv3.

LOTS_VERSION = "1.00"

require 'colorize'

require_relative "lib/ui"
require_relative "lib/world"
require_relative "lib/character"
require_relative "lib/story"

# Create a new UI and world
ui = LOTS::UI.new
world = LOTS::World.new

# Clear the screen and print welcome message
ui.clear
ui.welcome

# Ask name
name = ui.ask("What is your name?", /\w/)

# Create a new player
player = LOTS::Character.new(name, world)

# Show intro story
ui.new_line
story = LOTS::Story.new
ui.draw_frame(story.intro)

# MAIN INPUT LOOP
running = 1
while running
  ui.new_line
	cmd = ui.get_cmd
  case cmd
    when "map"
      map = world.get_map(player)
      ui.draw_frame(map)
    when "version", "ver"
      ui.display_version
	  when "up", "north"
			player.y -= 1
    when "down", "south"
			player.y += 1
  	when "left", "west"
			player.x -= 1
  	when "right", "east"
			player.x += 1
		when "quit"
      ui.quit
      running = nil
    else
      ui.not_found
  end
end
