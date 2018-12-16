class Residence < ApplicationRecord
	
	has_many :weeks
	validates :title, presence:true, uniqueness:true
	validates :address, presence:true
	validates :image, presence:true
	validates :country, presence:true
	validates :province, presence:true
	validates :locality, presence:true
	validates :price, presence:true

	def self.search(params)
	  if (params[:term1] && params[:term])
	  	r = where("LOWER(country) LIKE '%#{params[:term1].downcase}%' OR LOWER(province) LIKE '%#{params[:term1].downcase}%' OR LOWER(locality) LIKE '%#{params[:term1].downcase}%' OR LOWER(title) LIKE '%#{params[:term1].downcase}%' ")
	  	r.includes(:weeks).references(:weeks).merge(Week.where("period = '%#{params[:term]}%'"))
	  else
	    all
	  end
	end
end
