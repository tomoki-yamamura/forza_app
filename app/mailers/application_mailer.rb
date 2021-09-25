class ApplicationMailer < ActionMailer::Base
  # どこから送るか
  default from: 'noreply@example.com'
  layout 'mailer'
end
