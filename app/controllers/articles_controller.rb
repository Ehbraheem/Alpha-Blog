class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: article_params.inspect
    @article = Article.new article_params
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article) and return
    end
    # flash[:warning]
    render 'new'
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update article_params
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article) and return
    end
    render 'edit'
  end

  def show
    @article = Article.find params[:id]
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy if @article
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end