class ArticlesController < ApplicationController
  # set up a controller with user authentication
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    authorize @articles
    # The authorize method automatically infers that Article will have a matching ArticlePolicy class, and instantiates this class, handing in the current user and the given record.
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    # For the current signed-in user
    @article.user = current_user
    authorize @article

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
      authorize @article
    end

    def article_params
      params.require(:article).permit(:title, :body, :status, :user_id)
    end
end
