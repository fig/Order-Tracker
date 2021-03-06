require 'rails_helper'

describe Order do

  it 'is an ApplicationRecord' do
    is_expected.to be_an(ApplicationRecord)
  end

  context "all coordinates present" do
    let(:order) { Order.new(start_point: "52.5200, 13.4050", restaurant_location: "52.6200, 13.4050", customer_location: "52.5200, 13.4750" ) }

    it "should return sum of distances" do
      expect(order.total_distance).to eq 23203.526708347956
    end

    it "should return distance to restaurant only" do
      expect(order.start_to_restaurant_distance).to eq 11119.492664455242
    end

    it "should return distance to customer only" do
      expect(order.restaurant_to_customer_distance).to eq 12084.034043892716
    end
  end

  describe "validations" do
    it { should validate_presence_of(:start_point).with_message(": PLEASE FILL IN THIS FIELD!") }
    it { should validate_presence_of(:restaurant_location).with_message(": PLEASE FILL IN THIS FIELD!") }
    it { should validate_presence_of(:customer_location).with_message(": PLEASE FILL IN THIS FIELD!") }
  end

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe 'database' do

    it 'has columns' do
      is_expected.to have_db_column(:id).of_type(:integer)
      is_expected.to have_db_column(:start_point).of_type(:string)
      is_expected.to have_db_column(:restaurant_location).of_type(:string)
      is_expected.to have_db_column(:customer_location).of_type(:string)
      is_expected.to have_db_column(:fee).of_type(:decimal)
      is_expected.to have_db_column(:user_id).of_type(:integer)
      is_expected.to have_db_column(:restaurant).of_type(:string)
      is_expected.to have_db_column(:created_at).of_type(:datetime)
      is_expected.to have_db_column(:updated_at).of_type(:datetime)
    end
  end
end