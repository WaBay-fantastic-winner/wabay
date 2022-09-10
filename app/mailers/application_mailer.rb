# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'wubay@gmail.com'
  layout 'mailer'
end
