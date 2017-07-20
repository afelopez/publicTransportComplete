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

require 'rails_helper'

RSpec.describe Track, type: :model do
  it { should belong_to(:client) }
  it { should belong_to(:vehicle) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:time) }
end
