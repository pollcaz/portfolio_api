require 'rails_helper'

RSpec.describe 'User', type: :model do
  before { @user = build(:user) }

  subject { @user }

  context 'base' do
    it 'has a valid factory' do
      expect(create(:user)).to be_valid
    end

    describe 'When use with_profile key' do
      it 'creates an user with its respective profile' do
        expect(user = create(:user, :with_profile)).to be_valid
        expect(user.profile.present?).to be_truthy
      end
    end
  end

  describe 'Validations' do
    it { expect(subject).to validate_uniqueness_of(:email).case_insensitive }

    it 'has the correct format' do
      expect(subject).to allow_value(Faker::Internet.email).for(:email)
      expect(subject).to_not allow_value('@.10').for(:email)
      expect(subject).to allow_value("'some-thing.odd@example.com").for(:email)
    end

    it 'has a valid password' do
      expect(subject).to allow_value('123456').for(:password)
      expect(subject).to_not allow_value('@.10').for(:email)
    end
  end
end
