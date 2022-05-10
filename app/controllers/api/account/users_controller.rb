module Api
    module Account
        class UsersController < ApplicationController
            before_action :set_user, only: [:show, :update, :destroy]

            def index
                users = User.order(created_at: :desc)
                render json: {
                    status: 'SUCCSESS',
                    message: 'Loaded users',
                    data: users
                }
            end

            def show
                render json: {
                    status: 'SUCCSESS',
                    message: 'Loaded the user',
                    data: @user
                }
            end

            def create
                user = User.new(user_params)
                if user.save
                    render json: {
                        status: 'SUCCSESS',
                        data: user
                    }
                else
                    render json: {
                        status:'ERROR',
                        data: user.errors
                    }
                end
            end

            def destroy
                @user.destroy
                render json: {
                    status: 'SUCCSESS',
                    message: 'Deleted the user',
                    data: @user
                }
            end

            def update
                if @user.update(user_params)
                    render json: {
                        status: 'SUCCSESS',
                        message: 'Updated the user',
                        data: @user
                    }
                else
                    render json: {
                        status: 'SUCCSESS',
                        message: 'Not updated',
                        data: @user.errors
                    }
                end
            end

            private
                def set_user
                    @user = User.find_by(id: params[:id])
                end

                def user_params
                    params.require(:user).permit(:name, :sex, :email, :prefecture, :birthday)
                end

        end
    end
end