# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string
#  distance   :integer
#  time       :integer
#  vehicle_id :integer
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  belongs_to :vehicle
  belongs_to :client

  validates_presence_of :name, :distance, :time
end
