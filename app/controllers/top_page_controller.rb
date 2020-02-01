# frozen_string_literal: true

class TopPageController < ApplicationController
  before_action :set_values

  private
    def set_values
      @first_values = {
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
      @second_values = {
        '1s': 1,
        '2p': 22,
        '3m': 33,
        '東': 41,
        '白': 51,
        '発': 52,
        '中': 53,
      }
    end
end
