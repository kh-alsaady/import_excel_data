class ExcelsController < ApplicationController
  
  resource_description do
    short 'Api for imorting excel data'
  end
  
  def index
  end
  
  api 'POST', 'excel/import', 'Import excel data'
  param :file, ActionDispatch::Http::UploadedFile, desc: "Excel file", required: true
  def import
    @data = Excel.import(params[:file])
    
    render json: { success: true, message: 'imported successfully', data: @data }, status: 200  
  end

  api 'POST', 'excels/test', 'Just for testing'
  param :data, String, desc: 'some text'
  def test
    data = "aaab #{params[:data]}"    
 
    render json: { success: true, message: 'Tested successfully', data: data }, status: 200
  end
end
