class Api::V1::BaseController < ApplicationController
  
  rescue_from Apipie::ParamMissing do |e|
    render json: {success: false, messege: e.message, data: {}}
  end
  
end