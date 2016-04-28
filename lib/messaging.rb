module Messaging
  def get_messages(number)
    options = {
      headers: {
        "authorization" => user_token
      },
      body: {
        page: number
      }
    }
    response = self.class.get("#{@base_uri}/message_threads", options)
    JSON.parse response.body
  end

  def create_message(string, text)
    options = {
      headers: {
        "authorization" => user_token
      },
      body: {
        user_id: 2328805,
        recipient_id: 539470,
        subject: string,
        "stripped-text" => text
      }
    }
    response = self.class.post("#{@base_uri}/messages", options)
    JSON.parse response.body
  end
end
