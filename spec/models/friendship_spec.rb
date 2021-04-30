require 'rails_helper'
RSpec.describe Post, type: :model do
    describe 'associations' do
      it 'belong to user' do
        expect { should belong_to(user) }
      end
      it 'belong to friend' do
        expect { should belong_to(friend) }
      end
    end
end