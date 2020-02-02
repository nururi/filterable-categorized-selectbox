# frozen_string_literal: true

class TopPageController < ApplicationController
  before_action :set_values

  private
    def set_values
      @first_values = tile_categories
      @second_values = {}
    end
    # tiles
    def tile_categories
      {
        '萬子': 0,
        '筒子': 1,
        '索子': 2,
        '風牌': 3,
        '三元牌': 4,
      }
    end
    def characters
      1..9.map { | number | ["#{number}萬", (10 * 0) + number ] }.to_h.symbolize_keys
    end
    def dots
      1..9.map { | number | ["#{number}筒", (10 * 1) + number ] }.to_h.symbolize_keys
    end
    def bamboos
      1..9.map { | number | ["#{number}索", (10 * 2) + number ] }.to_h.symbolize_keys
    end
    def wings
      {
        '東': (10 * 3) + 1,
        '南': (10 * 3) + 2,
        '西': (10 * 3) + 3,
        '北': (10 * 3) + 4,
      }
    end
    def dragons
      {
        '白': (10 * 4) + 1,
        '発': (10 * 4) + 2,
        '中': (10 * 4) + 3,
      }
    end
end
