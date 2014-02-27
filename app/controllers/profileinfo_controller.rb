class ProfileinfoController < ApplicationController
  def personalinfo
  end

  def uploaddatabyexcel
  end

  def import
  end

  def storedata
    temp = true
    case File.extname(params[:file].original_filename)
      when ".csv" then ex = Roo::Csv.new(params[:file].path)
      when ".xls" then ex = Roo::Excel.new(params[:file].path nil, :ignore)
      when ".xlsx" then ex = Roo::Excelx.new(params[:file].path, nil, :ignore)
      when ".ods" then ex = Roo::OpenOffice.new(params[:file].path, nil, :ignore)
      else  temp = false
    end
    respond_to do |format|
      if temp 
        ex.each_with_pagename do |name, sheet|
          ((sheet.first_row)..(sheet.last_row)).each do |line| #start and end of row
            (sheet.first_column..sheet.last_column).each do |data|  
              name = ex.cell(line, data)
              Role.create(:name => name)
            end
          end
        end
         flash[:notice] = 'Data succesfully uploaded'
         format.html{ redirect_to roles_path } 
      else
        flash[:notice] = 'Files with .csv, .xls, .xlsx, ods extension are accepted'
        format.html{ redirect_to(action: 'import', controller: 'profileinfo') }
      end
    end 
  end

  def manualdata
  end

  def search
  end

  def elearning
  end

  def newsletter
  end
end
