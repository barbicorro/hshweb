class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	default_scope -> { order("email") }
	validates :date_venc_month, inclusion: { in: %w(Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre),
    message: "%{value} no es un mes valido" }
    validates :date_venc_year, exclusion:{in:0..2018}
	validates :name, presence:true
	validates :lastname, presence:true
	validates :image, presence:true
	validates :card_Marca, presence:true
	validates :card_Number, presence:true,numericality:true, length:{minimum: 16, maximum:16,message: "Debe tener 16 digitos"}
	validates :cod, presence:true,numericality:true, length:{minimum: 3, maximum:3, message: "Debe tener 3 digitos numericos"}

 	has_many :inscriptions
	has_many :weeks, through: :inscriptions
end
