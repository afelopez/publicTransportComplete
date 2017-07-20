# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ApplicationRecord
  has_many :tracks
  has_many :vehicles, through: :tracks
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_presence_of :name, :email
  validates :email, format: { with: VALID_EMAIL_REGEX  }, uniqueness: { case_sensitive: false }
end
