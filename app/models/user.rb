class User < ApplicationRecord
   #Se me agrego porque puse en el scaffold password:digest
   has_secure_password

   #validaciones
   validates :email, uniqueness: true, presence: true
   validates :password, length: { minimum: 8, maximum: 16 }, on: :create

   # estan EN DEPENDENCIA del destroy
   has_many :guardarropas, dependent: :destroy
   has_many :atuendos, dependent: :destroy
   has_many :prendas, dependent: :destroy


   def generate_password_token!
      self.reset_password_token = generate_token
      self.reset_password_sent_at = Time.now.utc
      save!
   end

   def password_token_valid?
      (self.reset_password_sent_at + 4.hours) > Time.now.utc
   end

   def reset_password!(password)
      self.reset_password_token = nil
      self.password = password
      save!
   end

   private

   def generate_token
      SecureRandom.hex(10)
   end




end
