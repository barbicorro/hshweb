class Sale < ApplicationRecord
  belongs_to :week, required: false 
end
