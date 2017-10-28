require 'spec_helper'

RSpec.describe Spree::Supplier, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:uid) }
  it { should validate_uniqueness_of(:uid) }
end
