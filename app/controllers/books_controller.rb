class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = 'Book was successfully created.'
        redirect_to book_path(@book.id)# 条件がtrueだったら処理1を行う
    else
        render("books/index") # 条件がfalseだったら処理2を行う
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
     if  @book.update(book_params)
      flash[:notice] = 'Book was successfully created.'
        redirect_to book_path(@book.id)# 条件がtrueだったら処理1を行う
     else
        render "edit"# 条件がfalseだったら処理2を行う
     end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
