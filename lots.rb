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

ui = LOTS::UI.new
world = LOTS::World.new

ui.clear
ui.welcome

map = world.get_map
ui.display_map(map)
