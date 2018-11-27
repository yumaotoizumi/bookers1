class BooksController < ApplicationController

	def new
		@book = Book.new
        @user = User.find(params[:id])
	end

	def create
        # ストロングパラメーターを使用
         @book = Book.new(book_params)
         @book.user_id = current_user.id
        # DBへ保存する

         if @book.save
            flash[:notice] = "successfull"
            redirect_to book_path(@book.id)

        else
            @user = current_user
            @books = Book.all
            render "index"
        end

    end

    def index
        @user = current_user
    	@books = Book.all
        @book = Book.new


    end

    def show
        @book = Book.find(params[:id])
        @bookn = Book.new
        @books = Book.all
        @user = @book.user

    end
    def edit
        @book = Book.find(params[:id])
        if @book.user != current_user
            redirect_to user_path(current_user)
        end

    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "successfull"
            redirect_to book_path(@book.id)
        else
            render "edit"

        end

    end
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end


	private
	def book_params
		params.require(:book).permit(:title,:body)
	end
end

