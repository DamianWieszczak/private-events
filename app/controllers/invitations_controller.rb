class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  def index
    @invitations = Invitation.all
  end

  def show
    
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    
    if @invitation.save
      redirect_to root_path
      flas[:notice] = "You joined to even successfully"
    else
      render :new
      flas.now[:alert] = "Something went wrong"
    end
  end

  def edit
    
  end

  def update
  
    if @invitation.update(invitation_params)
      redirect_to root_path
      flash[:notice] = "Your invitation was updated successfully"
    else
      render edit
      flash[:alert] = "Something went wrong"
    end
  end

  def destroy
        
    @invitation.destroy
    redirect_to root_path
    flash[:notice] = "Invitation was deleted successfully"
  end

  private

    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    def invitation_params
      params.require(:invitation).permit(:event_id, :user_id)
    end
end