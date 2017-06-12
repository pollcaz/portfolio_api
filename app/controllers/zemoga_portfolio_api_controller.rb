class ZemogaPortfolioApiController < BaseApiController
  # Note: For this test those endpoints not require authentication are publics,
  # but they should be validate by token authentication in normal conditions for security

  # get user profile info an it returns in the profile record in json format
  # request example:
  # * http://localhost:3000/zemoga_portfolio_api/user_info?id=1
  # in case an error ocurrs it will return the error message in json format too
  def user_info
    profile = Profile.find(params[:id])
    json_response(profile)
  end

  # POST update user profile info
  # request example:
  # $ curl -X POST -d "id=1&user_name=Paulo Carmona Z" http://localhost:3000/zemoga_portfolio_api/modify_user_info
  # $ curl -H "Content-Type: application/json" -X POST -d '{"id":"1","user_name":"Admin"}' http://localhost:3000/zemoga_portfolio_api/modify_user_info
  # in case an error ocurrs it will return the error message in json format too
  def modify_user_info
    profile = Profile.find(params[:id])
    profile.update_attributes!(profile_params)
    json_response(profile, :accepted)
  end

  private
  # just permit this params to be updated by the post request
  def profile_params
    params.permit(:user_name, :description, :twitter_account, :image_link)
  end
end
