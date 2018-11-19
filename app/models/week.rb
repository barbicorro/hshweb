class Week < ApplicationRecord
	belongs_to :residence
	validates :status_id, presence:true
end
