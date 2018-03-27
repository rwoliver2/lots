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

class Story

	def intro
		return STORY_INTRO
	end

end

end
