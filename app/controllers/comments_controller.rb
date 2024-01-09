class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    # @prototype = Prototype.find(params[:id])
    # コメントの保存が失敗した場合にエラーメッセージを表示する
    if @comment.save
        redirect_to prototype_path(@comment.prototype)
    else
        @prototype = @comment.prototype
        @comments = @prototype.comments
        render "prototypes/show"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    end
  #   params.require(:comment).permit(:comment).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  # end
end

# この　def create と　private 内のストロングパラメーターの内容はhttps://master.tech-camp.in/v2/curriculums/8380問題7と思う