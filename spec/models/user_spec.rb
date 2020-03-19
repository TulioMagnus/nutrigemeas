require 'rails_helper'

RSpec.describe User, type: :model do
  subject { 
    described_class.new(
      password: 123456,
      password_confirmation: 123456,
      email: Faker::Internet.email
    )  
  }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:password_confirmation) } 
  it { expect(subject).to be_valid } 
end
