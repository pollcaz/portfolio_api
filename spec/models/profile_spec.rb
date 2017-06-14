require 'rails_helper'

RSpec.describe 'Profile', type: :model do
  before { @profile = build(:profile) }

  subject { @profile }

  context 'base' do
    it 'has a valid factory' do
      expect(create(:profile)).to be_valid
    end
  end

  describe 'Validations' do
    it { expect(subject).to validate_presence_of(:user_name) }
    it { expect(subject).to_not allow_value('').for(:user_name) }
    it { expect(subject).to_not allow_value('').for(:twitter_account) }
    it { expect(subject).to allow_value('zemoga').for(:twitter_account) }
  end

  describe 'when user no select any picture' do
    it 'puts a default picture' do
      default_pic_url = '/system/missing_avatar_profile_'
      expect(subject.profile_image.url).to eq default_pic_url + 'original.jpg'
      expect(subject.profile_image.url('100x100')).to eq default_pic_url + '100x100.jpg'
      expect(subject.profile_image.url('300x300')).to eq default_pic_url + '300x300.jpg'
    end
  end

  # Not implemented yet
  xit 'uploads picture in jpg, png, gif formats' do
    expect(subject).to allow_value(tmp_pic).for(:profile_image)
  end
end
