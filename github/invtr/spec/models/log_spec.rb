require 'rails_helper'
require 'spec_helper'

RSpec.describe Log, type: :model do
	it { should validate_presence_of(:type) }
	it { should validate_presence_of(:action) }
	it { should validate_presence_of(:data) }
end
