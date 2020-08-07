class BooksController < ApplicationController

  before_action :authenticate_user!


  def create
    @book=Book.new(book_params)
    @books=Book.all
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id) ,notice: "You have created book successfully."
    else
      render "index"
    end
  end

  def index
    @books=Book.all
    @book=Book.new

    #@book=Book.find(params[:id])

    
  end

  def show
    @book=Book.find(params[:id])
    @book_new =  Book.new
    @user = @book.user
    @comment = Comment.new
  end

  def edit
    @book=Book.find(params[:id])
    if current_user != @book.user
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id) ,notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book=Book.find(params[:id])
    #@book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
     #@user = @book.user
  end

  private
  def book_params
    params.require(:book).permit(:title, :use_id)
  end
end
