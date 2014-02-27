class ReportsController < ApplicationController
	def index
		@users = User.paginate(:per_page => 5, :page => params[:page])	
	end

	def generatereport
	 	respond_to do |format|
      format.pdf do
       render :pdf => "file_name",
             :template => 'reports/generatereport.html.erb',
             :orientation => 'Landscape'               
      end
    end    
	end
end
  