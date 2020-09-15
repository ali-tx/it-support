class ArticlesController < ApplicationController
  before_action :authenticate_user!
  # layout 'standard'
  def new
    @article = Article.new
  end
  def index
    @articles = Article.all
    if params[:search]
      @recipes = Article.search(params[:search]).order("created_at DESC")
    else
      @recipes = Article.all.order("created_at DESC")
    end
  end
  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  def show
    @article = Article.find(params[:id])
  end




  private
  def article_params
    params.require(:article).permit(:country, :city, :candidate_name, :skills, :email, :phone)
  end
end
