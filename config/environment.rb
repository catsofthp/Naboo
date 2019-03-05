# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

=begin
ActionMailer::Base.smtp_settings = {
    :user_name => ENV['API_KEY'],
    :password => ENV['SECRET_KEY'],
    :password => ENV['EMAIL_MAILJET'],
    :domain => 'localhost',
    :address => 'in-v3.mailjet.com',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}

=end