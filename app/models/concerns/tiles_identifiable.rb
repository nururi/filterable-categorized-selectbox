# frozen_string_literal: true

module TilesIdentifiable
  extend ActiveSupport::Concern

  included do
    def tile_categories
      {
        '萬子': 0,
        '筒子': 1,
        '索子': 2,
        '風牌': 3,
        '三元牌': 4,
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

    # tile: { display_name:, index: }
    def characters(base_index: 10 * 0)
      numbers.map { | number | { display_name: "#{to_chinese_numerals(number)}萬", index: base_index + number } }
    end

    def dots(base_index: 10 * 1)
      numbers.map { | number | { display_name: "#{to_chinese_numerals(number)}筒", index: base_index + number } }
    end

    def bamboos(base_index: 10 * 2)
      numbers.map { | number | { display_name: "#{to_chinese_numerals(number)}索", index: base_index + number } }
    end

    def wings(base_index: 10 * 3)
      ['東', '南', '西', '北'].map.with_index(1) {
        | wing, index | { display_name: wing, index: base_index + index } }
    end

    def dragons(base_index: 10 * 4)
      ['白', '發', '中'].map.with_index(1) {
        | dragon, index | { display_name: dragon, index: base_index + index } }
    end

    def all_tiles
      characters | dots | bamboos | wings | dragons
    end
  end
end
