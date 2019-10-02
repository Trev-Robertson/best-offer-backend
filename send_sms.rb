# twilio api:core:messages:create \
#   --from "+15307716775" \
#   --to "+13012567282" \
#   --body "ayyyye"

require 'twilio-ruby'
require 'pry'
require 'rails'



# account_sid = Rails.application.credentials.dig(:twilio_account_sid)
# auth_token = Rails.application.credentials.dig(:twilio_auth_token)
# auth_token = Rails.application.credentials.twilio_auth_token

account_sid = 'ACd998ff1bdfe4a27e2657ef12a240d4c0'
auth_token = 'a3a97d6e81429d01270c3086c0aa3479'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+15307716775' # Your Twilio number
to = '+3012567282' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Encrypted Key"
)