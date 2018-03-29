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
player = LOTS::Character.new({:name => name, :world => world})

# Show intro story
ui.new_line
story = LOTS::Story.new
ui.draw_frame({:text => story.intro})

# Show the map for the first time
map = world.get_map({:player => player})
ui.draw_frame({:text => map})

# MAIN INPUT LOOP
running = 1
player.in_combat = false
while running
  ui.new_line
  cmd = ui.get_cmd
  case cmd
    when "map"
      map = world.get_map({:player => player})
      ui.draw_frame({:text => map})
    when "version", "ver"
      ui.display_version
    when "name", "whoami"
      ui.display_name({:player => player})
    when "location", "loc", "where", "whereami"
      ui.show_location({:player => player})
    when "look", "what", "around"
      world.check_area({:player => player, :ui => ui, :story => story})     
    when "up", "north", "u", "n"
      unless player.in_combat
        player.move({:direction => :up, :world => world, :ui => ui, :story => story})
      else
        ui.cannot_travel_combat
      end
    when "down", "south", "d", "s"
      unless player.in_combat
        player.move({:direction => :down, :world => world, :ui => ui, :story => story})
      else
        ui.cannot_travel_combat
      end
    when "left", "west", "l", "w"
      unless player.in_combat
        player.move({:direction => :left, :world => world, :ui => ui, :story => story})
      else
        ui.cannot_travel_combat
      end
    when "right", "east", "r", "e"
      unless player.in_combat
        player.move({:direction => :right, :world => world, :ui => ui, :story => story})
      else
        ui.cannot_travel_combat
      end
    when "quit"
      ui.quit
      running = nil
    else
      ui.not_found
  end
end
