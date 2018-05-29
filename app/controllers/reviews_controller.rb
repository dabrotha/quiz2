class ReviewsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]

    def show
        @question = Question.find params[:id]
    end
    
    def create
        review_params = params.require(:review).permit(:body)
        @review = Review.new (review_params)
        @review.user = current_user
        @review.idea_id = params[:idea_id]
        
        if @review.save
            redirect_to idea_path(@review.idea)
        else
            render :new
        end
    end
    
    def destroy
        
        @review = Review.find params[:id]
        @review.destroy
        # redirect_to ideas_path
    end
    

    private

    def find_review
        @review = Review.find(params[:id])
      end
      
      
        def authorize_user!
          unless can?(:manage, @review)
            flash[:alert] = "Access Denied"

          end
        end

        def review_params
            params.require(:review).permit(:body)
          end
        
          def find_review
            @review = Review.find(params[:id])
          end
    
end