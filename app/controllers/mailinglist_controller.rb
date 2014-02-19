class MailinglistController < ActionController::Base
  def subscribe
    email = params[:email]
    gb = Gibbon::API.new(ENV['MAILCHIMP_API_KEY'])
    logger.info "Sending #{email} to MailChimp..."
    begin
      gb.lists.subscribe({:id => ENV['MAILCHIMP_LIST_ID'], :email => {:email => email}, :double_optin => false})
      flash.notice = 'You have been subscribed to the mailing list!'
    rescue Gibbon::MailChimpError => e
      logger.info "MailChimp replied: #{e.message} #{e.code}"
      flash.notice = e.message
    end
    
    redirect_to :back
  end
end
