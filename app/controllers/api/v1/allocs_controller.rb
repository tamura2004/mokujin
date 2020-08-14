class Api::V1::AllocsController < ApplicationController
  def index
    @allocs = Alloc.view
    @months = 12.times.map { _1.months.after.beginning_of_month.strftime("%m月") }
  end
end
