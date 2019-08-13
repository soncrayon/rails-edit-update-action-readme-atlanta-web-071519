class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    set_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    set_article
  end

  def update
    set_article
    @article.update(article_params)
    redirect_to article_path(@article)
  end
  # add edit and update methods here

  private

  def set_article
    @article = Article.find(params[:id])
  end 

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
