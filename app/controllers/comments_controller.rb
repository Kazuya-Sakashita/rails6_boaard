class CommentsController < ApplicationController
  before_action :set_community

  def new
    @comment = @community.comments.new
  end

  def create
    @comment = @community.comments.new(comment_params)
    if @comment.save
      redirect_to community_path(@community)
    else
      render :new
    end
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end

  def comment_params
    params.require(:comment).permit(:author_name, :content)
  end
end
