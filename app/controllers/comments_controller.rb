class CommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@comment = book.comments.new(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to request.referer
		#book = Book.find(params[:book_id])
		#comment = book.post_comments.new(post_comment_params)
		#comment.user_id = current_user.id
		#comment.save
		#redirect_to request.referer
	end

	def destroy
		#Comment.find_by(id: params[:id], book_id: params[:book_id]).destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to request.referer
	end

	def post_comment_params
		params.require(:comment).permit(:comment, :user_id)
		#params.require(:post_comment).permit(:comment)
	end
end
