class ApplicationMailer < ActionMailer::Base
  default from: '"Ne Pas Répondre" <nepasrepondre@segine.com>'
  layout 'mailer'

  def contact_notification(contact)
    @contact = contact

    if contact.cv.present? && contact.cover_letter.present?
      cv = 'CV-' + contact.email + '.' + contact.cv.file.extension.downcase
      attachments[cv] = File.read(File.open(contact.cv.path))
      cover_letter = 'LM-' + contact.email + '.' + contact.cover_letter.file.extension.downcase
      attachments[cover_letter] = File.read(File.open(contact.cover_letter.path))
    end

    # admins = FormMail.where(code_form: contact.code_form, domain_id: contact.domain_id)
    # recipients = []
    # admins.each { |a| recipients << a.email }
    # mail(to: "#{recipients}", subject: 'Nouveau contact')

    case contact.domain_id
      when 1
        emailTo = 'contact@segine-immobilier.com'
      when 2
        emailTo = 'christine.franc@immobiliere-des-victoires.com'
    end

    mail(to: emailTo, subject: 'Nouveau contact')
    render :'contact_mailer/contact_notification_recrutement' if contact.code_form == 'RECRUTEMENT'
  end

  def newsletter_notification(newsletter)
    @newsletter = newsletter
    # admins = FormMail.where(code_form: 'NEWSLETTER', domain_id: newsletter.domain_id)
    # recipients = []
    # admins.each { |a| recipients << a.email }
    # mail(to: "#{recipients}", subject: 'Inscription newsletter')

    case newsletter.domain_id
      when 1
        emailTo = 'contact@segine-immobilier.com'
      when 2
        emailTo = 'christine.franc@immobiliere-des-victoires.com'
    end

    mail(to: emailTo, subject: 'Inscription newsletter')
  end


end
