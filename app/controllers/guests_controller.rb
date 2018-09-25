class GuestsController < ApplicationController
  
  def new
    @guest = Guest.new
  end

  def make
    @guest = Guest.new(guest_params)
    @guest.save
    if @guest.save
     # @guest.send_mail(@guest) # Instance method in Guest model
       NotifierMailer.guest_info(@guest).deliver_now
       flash[:notice] = "Your request has been sent! Thank you for contacting us."
      redirect_to welcome_path
    else
      render 'new'
    end
  end

  private
  
  def guest_params
      params.require(:guest).permit(:fname, :lname, :phone, :email, :interest)
  end

end