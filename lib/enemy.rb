#!/usr/bin/env ruby
#
# Legend of the Sourcerer
# Written by Robert W. Oliver II <robert@cidergrove.com>
# Copyright (C) 2018 Sourcerer, All Rights Reserved.
# Licensed under GPLv3.
#
# Enemy Class
#

module LOTS

ENEMY_CATALOG = [
  [:name => "Imp", :health => 3, :mana => 0, :str => 3, :lines => 1], 
  [:name => "Rabid Wolf", :health => 4, :mana => 0, :str => 4, :lines => 2],
  [:name => "Rock Giant", :health => 7, :mana => 3, :str => 5, :lines => 5],
  [:name => "Toxic Toad", :health => 2, :mana => 6, :str => 1, :lines => 2],
  [:name => "Rabid Bear", :health => 5, :mana => 0, :str => 4, :lines => 3],
  [:name => "Angry Fae", :health => 3, :mana => 10, :str => 2, :lines => 5]
]

class Enemy

  attr_accessor :name
  attr_accessor :health
  attr_accessor :mana
  attr_accessor :str
  attr_accessor :int
  attr_accessor :lines
  
  def initialize(args = nil)
    # Pick a random enemy
    selected_enemy = ENEMY_CATALOG.sample[0]    
    @name = selected_enemy[:name]
    @health = selected_enemy[:health] + rand(0..3)
    @mana = selected_enemy[:mana] + rand(0..3)
    @str = selected_enemy[:str]
    @lines = selected_enemy[:lines]
    @int = rand(2..6)
  end
  
end

end
