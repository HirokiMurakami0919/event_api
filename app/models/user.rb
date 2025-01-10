# frozen_string_literal: true

class User < ApplicationRecord
  has_many :members
  has_many :projects, through: :members
  
  has_secure_password
end
