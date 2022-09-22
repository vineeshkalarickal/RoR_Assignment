require 'rails_helper'

RSpec.describe Cart, type: :model do
  context "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:line_items).with_foreign_key(:cart_id) }
  end
end
