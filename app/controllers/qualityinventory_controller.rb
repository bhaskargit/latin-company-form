class QualityinventoryController < ApplicationController
	
	def new
		@qi = Qualityinventory.new
	end

	def create
		render :text => params[:qualityinventory][:companyname].inspect and return
		@qi = Qualityinventory.new(params[:qualityinventory])
		if @qi.save
			redirect_to new_qualityinventory_path
		else
			redirect_to new_qualityinventory_path
		end
	end

end

