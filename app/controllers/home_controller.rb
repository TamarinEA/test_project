class HomeController < ApplicationController

  def index
    @host = request.host
    @format = request.format
    @method_get = request.get?
    @headers = request.headers['Connection']
    @port = request.port
    @protocol = request.protocol
    @query_string = request.query_string
    @remote_ip = request.remote_ip
    @url = request.url
  end

  def load_file
    @file = {:word => params[:word] || "", :email => params[:email] || "test.project.noreplay@gmail.com"}
  end

  def search_in_file
    @file = params[:file]
    flash[:error] = []
    flash[:error] << 'Put file' unless @file[:name].present?
    flash[:error] << 'Enter word' unless @file[:word].present?
    flash[:error] << 'Enter email' unless @file[:email].present?
    if flash[:error].size > 0
      redirect_to home_load_file_path(@file)
    else
      DataFile.save(@file[:name])
      Resque.enqueue(SearchInFile, @file)
      redirect_to home_load_file_path
    end
  end
end
