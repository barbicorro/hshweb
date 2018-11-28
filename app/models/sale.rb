class Sale < ApplicationRecord
	belongs_to :residence
	belongs_to :week
	has_many :users
	validates :fechaInicio, presence:true
	validates :horaInicio, presence:true
	validates :precioBase, presence:true
	validates :week_id, presence:true
	validates :residence_id, presence:true
end
