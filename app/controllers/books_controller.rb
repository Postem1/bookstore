class BooksController < ApplicationController

  def new
    @page_title = 'Add Book'
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book  = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book added succesffully"
    redirect_to books_path
    else
    render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "Book updated succesffully"
    redirect_to books_path
    else
    render 'edit'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book deleted succesffully"
    redirect_to books_path
    else
      flash.now[:alert] = "Book was NOT succesffully deleted"
    render 'edit'
    end
  end

  def index
    @books = Book.all
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
    @categories = Category.all
  end

  private
    def book_params
      params.require(:book).permit(
      :title, :category_id, :author_id,
      :publisher_id, :isbn, :price, :buy,
      :format, :excerpt, :pages, :year, :coverpath)
    end
end
