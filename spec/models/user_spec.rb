require 'rails_helper'

RSpec.describe User do
  it 'will make a valid user' do
    user = build(:user)
    expect(user.valid?).to be true
  end
end
