# frozen_string_literal: true

class TopPageController < ApplicationController
  before_action :set_values

  private
    def set_values
      @values = {
        'HTML5': 1,
        'CSS3': 2,
        'JavaScript': 3,
        'jQuery': 4,
        'AngularJS': 5,
        'ReactJS': 6,
        'ReactNative': 7,
        'Bootstrap': 8,
        'Vue.js': 9,
        'Python': 10,
      }
    end
end
