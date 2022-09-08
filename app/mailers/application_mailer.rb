# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Wubay'
  layout 'mailer'
end
