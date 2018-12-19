class HomeController < ApplicationController

  def index
    @sliders = Slider.joins(:domain).where('domains.code = ?', current_domain)
    @newsletter = Newsletter.new
  end

  def newsletter_subscription
    @newsletter = Newsletter.new(newsletter_subscription_params)
    domain = Domain.find_by_code(current_domain)
    @newsletter.domain_id = domain.id
    if @newsletter.save
      NewsletterMailer.registration_confirmation(@newsletter).deliver_now
      flash[:success] = 'Veuillez valider votre inscription à la newsletter un email vient de vous être envoyé'
      redirect_to root_path
    else
      render 'index'
    end
  end

  def confirm_email
    @newsletter = Newsletter.find_by_confirm_token(params[:token])
    if @newsletter
      @newsletter.email_activate
      @newsletter.send_notifications!
      flash[:sucess] = " Votre inscription à la newsletter est maintenant validé"
      redirect_to root_url
    else
      flash[:error] = " Votre email n'existe pas et n'as pas pus être validé "
      redirect_to root_url

    end 
  end 


private

  def newsletter_subscription_params
    params.require(:newsletter).permit(:email)
  end

end

