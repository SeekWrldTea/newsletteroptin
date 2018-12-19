class NewsletterMailer < ApplicationMailer
default from: '"Ne Pas Répondre" <nepasrepondre@segine.com>'

  def registration_confirmation(newsletter)
    @newsletter = newsletter
    mail(:to => "#{newsletter.email}", :subject => "Confirmez votre inscription a la newsletter")
  end
end
