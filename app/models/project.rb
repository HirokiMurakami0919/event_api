# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :members
  has_many :users, through: :members

  validates :name, presence: true
  validates :place, presence: true
end
