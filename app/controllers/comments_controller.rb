class CommentsController < ApplicationController
  before_action :set_project
  before_action :set_comment, only: [:destroy]

  def index
    @comments = set_project.comments.all
  end

  def new
    @comment = set_project.comments.new
  end

  def create
     @comment = set_project.comments.create(comment_params)
     redirect_to @project
  end

  def destroy
    @comment.destroy
    redirect_to @project
  end

  private

  def set_project
      @project = Project.find(params[:project_id])
  end

  def set_comment
    @comment = @project.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :attachment)
  end

end
