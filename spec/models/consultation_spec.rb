require 'rails_helper'

RSpec.describe Consultation, type: :model do
  it { should belong_to(:pacient) }
end
