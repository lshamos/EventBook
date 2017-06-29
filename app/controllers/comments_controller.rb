class CommentsController < ApplicationController
  def index
    @comments = Event.find(params[:event_id]).comments
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @event = Event.find(params[:id])
    @event.comments.create({
      body: params[:comment][:body],
      user_id: current_user.id
    })
    redirect_to event_path(@event)
  end

  def edit

  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to event_path(@comment.event)
  end

  def comments_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
