# frozen_string_literal: true

class TopPageController < ApplicationController
  include TilesIdentifiable
  before_action :set_values

  private
    def set_values
      @first_values = tile_categories
      @second_values = {}
    end
end
