#!/usr/bin/env ruby
#
# Legend of the Sourcerer
# Written by Robert W. Oliver II <robert@cidergrove.com>
# Copyright (C) 2018 Sourcerer, All Rights Reserved.
# Licensed under GPLv3.
#
# UI Class
#

module LOTS

UI_FRAME_HORIZONTAL = "\u2501"
UI_FRAME_VERTICAL = "\u2503"
UI_FRAME_UPPER_LEFT = "\u250F"
UI_FRAME_LOWER_LEFT = "\u2517"
UI_FRAME_UPPER_RIGHT = "\u2513"
UI_FRAME_LOWER_RIGHT = "\u251B"

class UI

  # Clear the screen
  def clear
    print "\e[H\e[2J"
  end

  def display_map(map)
    puts
    draw_frame(map)
    puts
  end

  # Ask user a question. A regular expression filter can be applied.
  def ask(question, filter = nil)
    print question + " "
    if filter
      match = false
      answer = nil
      while match == false
        answer = gets.chomp
	if answer.match(filter)
	  return answer
	end
      end
    else
      return gets.chomp
    end
  end
  
  # Display welcome
  def welcome
    text = Array.new
    text << "Legend of the Sourcerer".light_green
    text << "Written by Robert W. Oliver II  ".white + "\u2709".light_white + " robert@cidergrove.com".white
    text << "Copyright \u00A9 Sourcerer, All Rights Reserved.".white
    text << "Licensed under GPLv3.".white
    draw_frame(text)
  end

  private

  def new_line
    print "\n"
  end
  
  def draw_vert_frame_begin
    print UI_FRAME_VERTICAL.yellow + " "
  end

  def draw_vert_frame_end
    print " " + UI_FRAME_VERTICAL.yellow
  end
  
  def draw_top_frame(width)
    print UI_FRAME_UPPER_LEFT.yellow
    (width - 2).times do
      print UI_FRAME_HORIZONTAL.yellow
    end
    print UI_FRAME_UPPER_RIGHT.yellow
    new_line
  end

  def draw_bottom_frame(width)
    print UI_FRAME_LOWER_LEFT.yellow
    (width - 2).times do
      print UI_FRAME_HORIZONTAL.yellow
    end
    print UI_FRAME_LOWER_RIGHT.yellow
    new_line
  end

  # Returns actual length of text accounting for UTF-8 and ANSI
  def get_real_size(text)
    text.uncolorize.size
  end

  # Returns size of longest string in array
  def get_max_size_from_array(array)
    max = 0
    array.each do |s|
      s_size = get_real_size(s)
      max = s_size if s_size > max
    end
    max + 4
  end

  # Draw text surrounded in a nice frame
  def draw_frame(text)
    # Figure out width automatically
    width = get_max_size_from_array(text)
    draw_top_frame(width)
    text.each do |t|
      t_size = get_real_size(t)
      draw_vert_frame_begin
      print t
      (width - (t_size + 4)).times do
        print " " 
      end
      draw_vert_frame_end
      new_line
    end
    draw_bottom_frame(width)
  end

end

end
