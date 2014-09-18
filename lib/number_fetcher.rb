require "mechanize"
require "uri"
require "json"
require "pp"
require "pry"

class NumberFetcher
  def fetch(name)
    agent = Mechanize.new
    agent.user_agent_alias = "Mac Safari"

    page = agent.get "http://gethuman.com/axj/?action=quickSearch&type=phone&term=#{URI.escape(name)}"
    json = JSON.parse(page.body)
    first = json.first
    if first[:id] == "0"
      nil
    else
      biz = first["biz"]
      page = agent.get("http://gethuman.com#{biz}")
      page.parser.css('h3.gh-contact-info a').text
    end
  end
end
