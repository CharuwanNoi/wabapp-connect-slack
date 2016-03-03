require 'slack-ruby-client'

class Bot < SlackRubyBot::Bot
  @id = 0

  def self.next_id
    @id = @id % 10 + 1
  end


  command 'vacation' do |client, data, match|
    @title_vacation = match['expression']

    # puts "VacationBot"+ @title_vacation
    Rails.cache.write next_id, { text: match['expression'] }
    # puts Rails.cache.read 
    # sessions['=a']= @title_vacation
    client.say(channel: data.channel, text: "OK. Success")
    
      Slack.configure do |config|
        config.token = 'xoxb-20805671205-QAZNqD9cFLQI2qfBbUaePaEj'
        fail 'Missing ENV[xoxb-20805671205-QAZNqD9cFLQI2qfBbUaePaEj]!' unless config.token
      end

      client = Slack::Web::Client.new
      client.auth_test
      client.chat_postMessage(channel: 'C0MFQU64C', text: "<@#{data.user}> "+match['expression'] , as_user: true)
      

      # session = ActionDispatch::Integration::Session.new(Rails.application)
      # @slack_data = "asdf"
      # session.get "/data_members", {summary: @slack_data}





      # session = ActionDispatch::Integration::Session.new(Rails.application)
      # session.get "/start_oauth", {sumary: @title_vacation}

      # raise "0002"
  end
# redirect_to controller: 'Calendar', action: 'oauth_callback', param1: @title_vacation 
  command 'why' do |client, data, match|
    client.say(channel: data.channel, text: "Whyyyyyy")
  end
  def create_event

  end

end