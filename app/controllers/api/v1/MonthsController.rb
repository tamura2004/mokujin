class Api::V1::MonthsController < ApplicationController
  def index
    @months = 12.times.map { _1.months.after.beginning_of_month.strftime("%Y-%m-01") }
    render json: JSON.pretty_generate(@months.as_json)
  end
end
