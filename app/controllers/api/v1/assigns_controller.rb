class Api::V1::AssignsController < ApplicationController
  def index
    @assign = Assign.view
    # @months = 12.times.map { _1.months.after.beginning_of_month.strftime("%m月") }
    render json: JSON.pretty_generate(@assign.as_json)
  end
end
