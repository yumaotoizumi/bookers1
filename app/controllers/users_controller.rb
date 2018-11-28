class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]
	before_action :authenticate_user!

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
			flash[:notice] = "successfully"
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
		@user = User.find(params[:id])
        @user_book = @user.books.all
        @book = Book.new
    end
     def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.save
        redirect_to user_path(@user.id)
    else
    	render 'edit'
    end
     end

	private
	def correct_user
		user = User.find(params[:id])
		if current_user != user
			redirect_to user_path
		end
	end


	def user_params
	    params.require(:user).permit(:name, :body, :image,:introduction)
	end
end
