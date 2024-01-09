class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # ログインしていなくても見れる
  before_action :set_prototype, except: [:index, :new, :create]
  # ログインしていない状態でも遷移できるページ
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  # ログインしていなかったら入れない

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
       @prototype = Prototype.new(prototype_params)
      if @prototype.save
          redirect_to root_path
      else
        render :new, status: :unprocessable_entity
     end
  end

  def show
     @prototype = Prototype.find(params[:id])
     @comment = Comment.new
     @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
     if @prototype.update(prototype_params)
       redirect_to prototype_path(params[:id])
     else
       render :edit, status: :unprocessable_entity
     end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

    private 
   def prototype_params
     params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
   end

   def set_prototype
    @prototype = Prototype.find(params[:id])
   end

   def contributor_confirmation
      redirect_to root_path unless user_signed_in?
      # redirect_to root_path unless current_user == @prototype.user

    end
end