# frozen_string_literal: true

class Api::TilesController < ApplicationController
  include TilesIdentifiable

  def index
    tile_category_id = params[:tile_category_id]
    render json: all_tiles and return if tile_category_id.blank?

    tile_category = tile_categories.key(tile_category_id.to_i)
    tiles =
      case tile_category
      when :萬子 then characters
      when :筒子 then dots
      when :索子 then bamboos
      when :風牌 then wings
      when :三元牌 then dragons
      else all_tiles
      end
    render json: tiles
  end
end
