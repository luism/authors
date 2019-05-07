class Api::V1::ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: { status: 'error', code: 404, errors: '',
                   message: 'couldn\'t find resource.' },
           status: :not_found
  end
end
