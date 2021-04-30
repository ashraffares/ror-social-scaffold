require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it 'belong to user' do
      expect { should belong_to(user) }
    end
    it 'belong to post' do
      expect { should belong_to(post) }
    end
  end
  it 'validate content presence' do
    expect { should validate_presence_of(:content) }
  end
end
