class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::ActiveRecordError, with: :return_404

  private

  def return_404
    render status:404, json: {}
  end
end