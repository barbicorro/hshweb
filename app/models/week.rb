class Week < ApplicationRecord
  belongs_to :residence
  validates :status, presence:true
end
