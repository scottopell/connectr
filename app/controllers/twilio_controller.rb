class TwilioController < ApplicationController

  def inboundsms
    body = params["Body"]
    from = params["From"]

    number = NumberFetcher.new.fetch(body)

    client = Twilio::REST::Client.new TWILIO_SID, TWILIO_TOKEN

    if number && number.present?

      to_user = client.account.calls.create(
        :from => TWILIO_NUM,
        :to => from,
        :url => setup_twilio_url(number)
      )
    else
      client.account.messages.create(
        :from => TWILIO_NUM,
        :to => from,
        :body => "We couldn't find a company with the name '#{body}'"
      )
    end
    render text: ""
  end

  def setup
    number = params[:id]
    resp = Twilio::TwiML::Response.new do |r|
      r.Say 'Connecting, please wait', voice: 'alice'
      r.Dial callerId: TWILIO_NUM do |d|
        d.Number number 
      end
    end
    render xml: resp.text
  end
end
