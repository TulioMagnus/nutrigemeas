# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      password: 123_456,
      password_confirmation: 123_456,
      email: Faker::Internet.email
    )
  end

  describe 'Associations' do
    it { should have_many(:patients) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { expect(subject).to be_valid }
  end
end
