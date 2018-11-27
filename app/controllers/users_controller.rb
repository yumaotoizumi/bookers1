class UsersController < ApplicationController

	def new
		@user = User.find(params[:id])

	end

	def edit
		@user = User.find(params[:id])

	end

	def create
		@user = User.new(user_params)
		@user_id = current_user.id
		if @user.save
			flash[:notice] = "successfull"
		redirect_to user_path

		else
            @user_id = current_user
            @books = Book.all
            render "edit"
        end

	end


	def index
		@users = User.all
        @book = Book.new
        @user = current_user

	end

	def show
		@user = current_user
        @user_book = @user.books.all
        @book = Book.new
    end
     def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
     end

	private

	def user_params
	    params.require(:user).permit(:name, :body, :image,:introduction)
	end
end
