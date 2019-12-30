
module Api
    module V1
        class PostsController < ApplicationController
            def index 
                @posts=Post.all
                render json: {status:'success',message:'posts loaded',data: @posts},status: :ok
            end
            def show
                @post = Post.find(
                params[:id]
                )
                render json: { status:'success',message:'post loaded',data:@post},status: :ok
            end
            

            def create
                @post = Post.new(permited_params)
                if @post.save
                  render json: {status:'Success',message:'post saved',data:@post},status: :ok
                else
                 render json: { status:'Error',message:@post.errors.full_messages,data:@post},status: :unprocessable_entity
                end
            end

           def destroy
               @post = Post.find(params[:id])
               if @post.destroy
                   render json: {message:'post deleted successifuly'},status: :ok
               else
                   render json: {message:@post.errors.full_messages},status: :unprocessable_entity
               end
           end

           def update
               @post=Post.find(params[:id])
               if @post.update(permited_params)
                 render json: {message:'post updated successifuly',data: @post},status: :ok
               else
                 render json: {message: @post.errors.full_messages},status: :unprocessable_entity
               end
           end
           


            private
            def permited_params
                params.require(:post).permit(:title,:body)
            end

        end
    end
end
