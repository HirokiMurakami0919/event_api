class Project < ApplicationRecord
  validates :name, presence: true
  validates :place, presence: true
end
