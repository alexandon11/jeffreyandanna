class WelcomeController < ApplicationController
  def index
    @feed = Feedzirra::Feed.fetch_and_parse("http://jeffreyandanna.us/blog/feed/")
    if session[:rsvp]
      @invitation = Invitation.find_by_rsvp(session[:rsvp])
      @invitation = @invitation.nil? ? @invitation : Invitation.new
    else
      @invitation = Invitation.new
    end

    render :layout => false
  end
end