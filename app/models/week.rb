class Week < ApplicationRecord
	has_one :sale
	validates :period, presence:true
    validates :status_id, presence:true
    validates :residence_id, presence:true

end
