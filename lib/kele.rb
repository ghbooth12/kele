require 'httparty'
# require 'json'

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

  def get_me
    response = HTTParty.get("#{@base_uri}/users/me", headers: { "authorization" => user_token })
    JSON.parse response.body
  end

  def mentor_id
    get_me["current_enrollment"]["mentor_id"]
  end

  def get_mentor_availability(id)
    response = HTTParty.get("#{@base_uri}/mentors/#{id}/student_availability", headers: { "authorization" => user_token })
    JSON.parse response.body
  end
end
