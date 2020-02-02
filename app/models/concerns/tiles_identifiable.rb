# frozen_string_literal: true

module TilesIdentifiable
  extend ActiveSupport::Concern

  included do
    def tile_categories
      {
        萬子: 0,
        筒子: 1,
        索子: 2,
        風牌: 3,
        三元牌: 4,
      }
    end

    def numbers
      1..9
    end

    def chinese_numerals
      ['一', '二', '三', '四', '五', '六', '七', '八', '九']
    end

    def to_chinese_numerals(number)
      chinese_numerals[number - 1]
    end

    # tiles: { name: index }
    def characters
      numbers.map { | number | [ "#{to_chinese_numerals(number)}萬", (10 * 0) + number ] }.to_h.symbolize_keys
    end

    def dots
      numbers.map { | number | [ "#{to_chinese_numerals(number)}筒", (10 * 1) + number ] }.to_h.symbolize_keys
    end

    def bamboos
      numbers.map { | number | [ "#{to_chinese_numerals(number)}索", (10 * 2) + number ] }.to_h.symbolize_keys
    end

    def wings
      {
        東: (10 * 3) + 1,
        南: (10 * 3) + 2,
        西: (10 * 3) + 3,
        北: (10 * 3) + 4,
      }
    end

    def dragons
      {
        白: (10 * 4) + 1,
        発: (10 * 4) + 2,
        中: (10 * 4) + 3,
      }
    end
  end
end
