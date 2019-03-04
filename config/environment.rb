# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => ENV['SENDGRID_LOGIN'], # ENV['GMAIL_LOGIN'] pour envoyer de son adresse perso
    :password => ENV['SENDGRID_PWD'], # ENV['GMAIL_PWD']
    :domain => 'shop.fr', # ou 'gmail.com'
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}
