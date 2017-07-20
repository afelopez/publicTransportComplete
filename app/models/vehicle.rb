# == Schema Information
#
# Table name: vehicles
#
#  id         :integer          not null, primary key
#  category   :integer
#  plate      :string
#  year       :integer
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vehicle < ApplicationRecord
  VALID_PLATE = /(abc|dfg)[0-9]{3}/i

  has_many :tracks
  has_many :clients, through: :tracks

  validates_presence_of :plate, :year, :color
  validates :plate, format: { with: VALID_PLATE }, uniqueness: { case_sensitive: false }
  validates :year, numericality: { only_integer: true }

  before_create :set_category

  private

  def set_category
    self.category =
      if plate[0..2] == 'ABC'
        1
      else
        2
      end
  end
end
