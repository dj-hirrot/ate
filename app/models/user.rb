class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: { general: 0, viewer: 1, admin: 2 }

  def admin?
    self.role == "admin"
  end
end
