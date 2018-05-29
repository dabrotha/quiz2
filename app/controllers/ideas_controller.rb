class IdeasController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_review, only: [:destroy]
    before_action :authorize_user!, only: [:destroy]

    def new
        @idea = Idea.new
    end

    def create
        # idea_params = params.require(:idea).permit(:title, :description)
        # Idea.create idea_params
        @idea = Idea.new idea_params
        @idea.user = current_user
        if @idea.save
            redirect_to idea_path(@idea)
          else
            redirect_to new_idea_path
          end
    end
    
    def show
        @idea = Idea.find params[:id]
        @review = Review.new
        # @comment = Comment.new
        # @comments = @post.comments
    end

    def index
        @ideas = Idea.all
    end

    def edit
        @idea = Idea.find params[:id]
    end
    
    def update
        idea_params = params.require(:idea).permit(:title, :description)
        @idea       = Idea.find params[:id]
        if @idea.update idea_params
          redirect_to idea_path(@idea)
        else
          render :edit  
        end
      end

      def destroy
        idea = Idea.find params[:id]
        idea.destroy
        redirect_to ideas_path
      end



end

    private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
#   def find_idea
#     @idea = Idea.find(params[:id])
#   end