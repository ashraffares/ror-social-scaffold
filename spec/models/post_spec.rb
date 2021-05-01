require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it 'belong to user' do
      expect { should belong_to(user) }
    end
  end
  it 'has many comments' do
    expect { should has_many(comments) }
  end
  it 'has many likes' do
    expect { should has_many(likes) }
  end
end
