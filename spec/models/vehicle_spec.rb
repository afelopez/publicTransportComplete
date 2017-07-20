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

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  subject { described_class.new(plate: 'ABC000', year: 2017, color: 'Black') }

  it { should have_many(:tracks) }
  it { should have_many(:clients).through(:tracks) }
  it { should validate_presence_of(:plate) }
  it { should_not allow_value('DEW123').for(:plate) }
  it { should validate_uniqueness_of(:plate).case_insensitive }
  it { should validate_presence_of(:year) }
  it { should validate_numericality_of(:year) }
  it { should validate_presence_of(:color) }

  describe '#category' do
    it 'is set to 1 if plate begins with ABC' do
      vehicle = described_class.create(plate: 'ABC000', year: 2017, color: 'Black')
      expect(vehicle.category).to eq 1
    end

    it 'is set to 2 if plate begins with DFG' do
      vehicle = described_class.create(plate: 'DFG000', year: 2017, color: 'Gray')
      expect(vehicle.category).to eq 2
    end
  end
end
