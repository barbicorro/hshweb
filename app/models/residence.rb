class Residence < ApplicationRecord
	default_scope -> { order("title") }
	has_many :weeks
	has_many :sales
	validates :title, presence:true, uniqueness:true
	validates :address, presence:true
	validates :image, presence:true
	validates :country, presence:true
	validates :province, presence:true
	validates :locality, presence:true
end
