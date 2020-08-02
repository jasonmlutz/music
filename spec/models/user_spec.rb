require 'rails_helper'

describe User do
  subject(:user) do
    FactoryBot.build(:user,
      email: "jason@fakesite.com",
      password: "tough_password")
  end
  
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
end
