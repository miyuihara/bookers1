class BooksController < ApplicationController

  def top
  end

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to @book
    else
      @books = Book.all
      render :index
    end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to @book
  end


  private

  def set_book
    @book = Book.find(params[:id])

  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end