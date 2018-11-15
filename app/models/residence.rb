class Residence < ApplicationRecord
	default_scope -> { order("title") }
	has_many :weeks
	validates	:description, length:{minimum:0,maximum:1500}
	validates :title, presence:true, uniqueness:true
end
