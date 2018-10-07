class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,#:trackable,
         :registerable#, :confirmable

  has_many :books, dependent: :delete_all
end
