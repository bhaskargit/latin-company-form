class Qualityinventory < ActiveRecord::Base
  attr_accessible :analysisgroup, :comment, :companydescription, :companyname, 
  :companywebsite, :cost, :field1explnation, :field2explanation, 
  :field2usefullforwhich, :gadgetdescription, :methodorgadget, :name, 
  :scientficdescription, :techologyused, :title, :usefulfor

  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
