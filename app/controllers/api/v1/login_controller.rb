class Api::V1::LoginController < ApplicationController
skip_before_action :authorized, only: [:index]

  ENV['CLIENT_ID'] = 'd9dbfa9ebabf431081a7d8c7df553196'

  ENV['CLIENT_SECRET'] = 'b1744cbd42244ac681a388e02371ed63'

  def index

    query_params ={
      client_id: ENV['CLIENT_ID'],
      response_type: "code",
      redirect_uri: 'http://localhost:3000/api/v1/logging-in',
      scope: "user-library-read user-library-modify playlist-modify-public user-top-read playlist-modify-public user-modify-playback-state user-follow-modify user-read-currently-playing user-read-playback-state user-follow-read app-remote-control streaming user-read-birthdate user-read-email user-read-private",
      show_dialog: true
    }

    url = "https://accounts.spotify.com/authorize/"

    redirect_to "#{url}?#{query_params.to_query}"
  end

end
