require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has email' do
    user = User.new email: 'gg@gmail.com'
    expect(user.email).to eq 'gg@gmail.com'
  end
end
