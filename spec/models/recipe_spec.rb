require 'rails_helper'

describe Recipe do
  it { should have_and_belong_to_many :tags }
  it { should validate_presence_of :name }
  it { should validate_presence_of :ingredients }
  it { should validate_presence_of :instructions }
  it { should validate_presence_of :rating }
end