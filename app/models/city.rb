class City < ApplicationRecord
  has_many :doctors
  has_many :patients 
  has_many :appointments, through: :doctors 
  has_many :appointments, through: :patients 
end
