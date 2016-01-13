require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:role) }
  it { should validate_length_of(:fullname) }
  it { should validate_length_of(:role) }
  it { should validate_length_of(:city) }
  it { should validate_length_of(:state_or_region) }
  it { should validate_length_of(:country) }

end


#======= From User.rb ==============#

  # validates :fullname, length: { maximum: 200 }
  # validates :role, length: { maximum: 30 }
  # validates :city, length: { maximum: 100 }
  # validates :state_or_region, length: { maximum: 100 }
  # validates :country, length: { maximum: 100 }

  # # Only validating presence of role as other attributes 'not required'
  # validates_presence_of :role 
