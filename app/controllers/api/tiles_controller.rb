# frozen_string_literal: true

class Api::TilesController < ApplicationController
  include TilesIdentifiable

  def index
    tile_category_id = params[:tile_category_id]
    if tile_category_id.blank?
      render json: all_tiles
    else
      render json: get_tiles(tile_category_id: tile_category_id.to_i)
    end
  end
end
