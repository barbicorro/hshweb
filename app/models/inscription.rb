class Inscription < ApplicationRecord
  belongs_to :week
  belongs_to :user
end
