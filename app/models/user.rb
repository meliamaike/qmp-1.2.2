class User < ApplicationRecord
   include GlobalID::Identification
   #Se me agrego porque puse en el scaffold password:digest
   has_secure_password

   #validaciones
   validates :email, uniqueness: true, presence: true
   validates :password, length: { minimum: 8, maximum: 16 }, on: :create

   # estan EN DEPENDENCIA del destroy
   has_many :guardarropas, dependent: :destroy
   has_many :atuendos, dependent: :destroy
   has_many :prendas, dependent: :destroy




end
