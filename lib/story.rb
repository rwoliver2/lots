#!/usr/bin/env ruby
#
# Legend of the Sourcerer
# Written by Robert W. Oliver II <robert@cidergrove.com>
# Copyright (C) 2018 Sourcerer, All Rights Reserved.
# Licensed under GPLv3.
#
# Story Class
#

module LOTS

STORY_INTRO = [
"Your journey to discover your true potential has been arduous, but a glimmer of hope shines in the darkness.",
"A vivid dream stirrs you from your sleep. You are instructed to visit the " + "Sourcerer".light_white + ", the Oracle of the Path.",
"He will provide the insight you need."
]

STORY_AREA_TREE = [
	"You see a magnificent tree standing tall above you."
]

STORY_AREA_WATER = [
	"You stand next to the banks of a crystal-clear lake."
]

STORY_AREA_MOUNTAIN = [
  "A majestic snow-topped mountain range graces the horizon."
]

class Story

	def intro
		return STORY_INTRO
	end

	def area_tree
		return STORY_AREA_TREE
	end
	
	def area_water
		return STORY_AREA_WATER
	end
	
	def area_mountain
		return STORY_AREA_MOUNTAIN
	end
	
end

end
