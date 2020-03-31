# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pacient, type: :model do
  it { should belong_to(:user) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:birth_date) }
end
