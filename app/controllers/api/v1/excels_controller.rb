class Api::V1::ExcelsController < Api::V1::BaseController
  
  resource_description do
    short 'Api for imorting excel data'
  end
  
  def index   
    render 'excels/index'
  end
  
  api 'POST', '/v1/excel/import', 'Import excel data'
  param :file, ActionDispatch::Http::UploadedFile, desc: "Excel file", required: true
  
  def import
    @data = Excel.import(params[:file])
    
    render json: { success: true, message: 'imported successfully', data: @data }, status: 200  
  end

  api 'POST', '/v1/excel/test', 'Just for testing'
  param :data, String, desc: 'some text', optional: true
  
  def test
    data = "aaab #{params[:data]}"    
 
    render json: { success: true, message: 'Tested successfully', data: data }, status: 200
  end
  
 
end
