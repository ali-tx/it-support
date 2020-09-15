class PagesController < ApplicationController
  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") #and return
    else

      @parameter = params[:search].downcase
      # @results = Post.all.where("lower(title) LIKE :search", search: @parameter)
      #@results = Post.where("lower(title) LIKE ?", "%#{@parameter}%")

      #Post.where(:title like ?).joins(:user).where("email = ?", "")

      # @results = Post.joins(:user).where("lower(title) LIKE ?  OR lower(email) LIKE ?", "%#{@parameter}%")
      @results = Article.joins(:user).where("lower(articles.country) LIKE ? OR lower(users.email) LIKE ?", "%#{@parameter}%","%#{@parameter}%")
      #select * from posts join users  where posts.user_id = users.id
    end

  end
end
