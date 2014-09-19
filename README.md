# Connectr
###AKA, how to have companies call you for support

This application was built as a mini-hack at BoilerMake Spring 2014.

This application addresses high initial investment to talk to a company on the phone.
You need to look up the company's number, and open up your phone, type in the number, and hit send. Sometimes you can't even find the company's number, or if you do, it won't be a human on the other end.

Connectr solves this. You simply text a number the name of a company that you want to talk to and Connectr queries dialahuman.com and calls them for you. Once the other end picks up, we call your phone.


## Tech
Makes heavy use of Nokogiri and the Twilio API.
Files of interest are `app/controllers/twilio_controller.rb` and `lib/number_fetcher.rb`
