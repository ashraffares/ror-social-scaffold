require 'rails_helper'

RSpec.describe 'associations' do
    it 'has many posts' do
      expect { should has_many(posts) }
    end
    it 'has many comments' do
      expect { should has_many(comments) }
    end
    it 'has many like' do
      expect { should has_many(likes) }
    end
    it 'has many  confirmed friendship' do
      expect { should has_many(confirmed_friendships) }
    end
    it 'has many friends' do
      expect { should has_many(friends) }
    end
    it 'has many inverse_friendships' do
      expect { should has_many(inverse_friendships).with_foreign_key }
    end
  end