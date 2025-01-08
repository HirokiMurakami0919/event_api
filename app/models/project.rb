class Project < ApplicationRecord
  has_many :users
  
  validates :name, presence: true
  validates :place, presence: true
end
