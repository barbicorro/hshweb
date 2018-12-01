class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	default_scope -> { order("Name") }
	validates :age,  presence:true ,numericality:true, inclusion:{in:21..99, message: "Debe ser mayor a 21 años"}
	validates :name, presence:true
	validates :lastname, presence:true
	validates :image, presence:true
	validates :card_Marca, presence:true
	validates :card_Number, presence:true,numericality:true, length:{minimum: 16, maximum:16,message: "Debe tener 16 digitos"}
	validates :cod, presence:true,numericality:true, length:{minimum: 3, maximum:3, message: "Debe tener 3 digitos numericos"}

 	has_many :inscriptions
	has_many :sales, through: :inscriptions
end
