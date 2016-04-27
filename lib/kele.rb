require 'httparty'

class Kele
  def initialize(email, password)
    @base_uri = 'https://www.bloc.io/api/v1'
    @options = { query: { email: email, password: password } }
  end

  def user_token
    hash = HTTParty.post("#{@base_uri}/sessions", @options)
    if hash["auth_token"]
      hash["auth_token"]
    else
      hash
    end
  end
end
