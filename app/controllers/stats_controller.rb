class StatsController < ApplicationController
  def index
    @stats = Stat.joins(:url).select('stats.*','urls.*')
  end
end
