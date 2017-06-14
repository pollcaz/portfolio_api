require 'rails_helper'

RSpec.describe ZemogaPortfolioApiController, type: :controller do
  describe 'GET #user_info' do
    context 'when does not send the profile id as argument' do
      it 'returns 404 error message in json format' do
        get 'user_info'
        expect respond_with 404
        expect(response.content_type).to eq 'application/json'
        res = JSON.parse(response.body, symbolize_names: true)
        expect(res[:message]).to include "Couldn't find Profile with 'id'="
      end
    end

    context 'when send the profile id as argument' do
      context 'and the profile does\'nt exist' do
        it 'returns error message in json format' do
          get 'user_info', :params => { :id => '2' }
          expect respond_with 404
          expect(response.content_type).to eq 'application/json'
          res = JSON.parse(response.body, symbolize_names: true)
          expect(res[:message]).to include "Couldn't find Profile with 'id'=2"
        end
      end

      context 'and the profile id is valid' do 
        it 'returns the profile object in json format' do
          profile = create :profile
          get 'user_info', params: { id: profile.id.to_s }
          expect respond_with 200
          expect(response.content_type).to eq 'application/json'
          res = JSON.parse(response.body)
          expect(res).to eq JSON.parse(profile.to_json)
        end
      end
    end
  end

  describe 'POST #modify_user_info' do
    before(:each) { @profile = create :profile }

    context 'when does not send profile id to update' do
      it 'returns error message in json format' do
        post :modify_user_info, params: { user_name: '' }
        expect respond_with 404
        expect(response.content_type).to eq 'application/json'
        res = JSON.parse(response.body, symbolize_names: true)
        expect(res[:message]).to include "Couldn't find Profile with 'id'="
      end
    end

    context 'When send invalid values as arguments' do
      it 'returns 422 error message about validations' do
        post :modify_user_info, params: { id: @profile.id, user_name: '' }
        expect respond_with 422
        expect(response.content_type).to eq 'application/json'
        res = JSON.parse(response.body, symbolize_names: true)
        expect(res[:message]).to include "Validation failed: User name can't be blank"
      end
    end

    context 'When send the profile id with the rest of params to update in database' do
      it 'returns the profile object in json format with the new values as response' do
        post :modify_user_info, params: { id: @profile.id, user_name: 'Master', twitter_account: 'zemoga' }
        expect respond_with 202
        expect(response.content_type).to eq 'application/json'
        res = JSON.parse(response.body, symbolize_names: true)
        expect(res[:user_name]).to eq @profile.reload.user_name
        expect(res[:twitter_account]).to eq @profile.twitter_account
        expect(res).to eq JSON.parse(@profile.to_json, symbolize_names: true)
      end
    end
  end
end
