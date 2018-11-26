class Week < ApplicationRecord
	belongs_to :residence
	has_one :sale
	validates :period, presence:true
    validates :status_id, presence:true
    validates :residence_id, presence:true
end
