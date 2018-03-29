#!/usr/bin/env ruby
#
# Legend of the Sourcerer
# Written by Robert W. Oliver II <robert@cidergrove.com>
# Copyright (C) 2018 Sourcerer, All Rights Reserved.
# Licensed under GPLv3.

LOTS_VERSION = "1.00"

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
in_battle = 0
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
      player.move(:up, world, ui, story)
    when "down", "south"
      player.move(:down, world, ui, story)
    when "left", "west"
      player.move(:left, world, ui, story)
    when "right", "east"
      player.move(:right, world, ui, story)
    when "quit"
      ui.quit
      running = nil
    else
      ui.not_found
  end
end
