class ArticlesController < ApplicationController

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

  def show
    @article = Article.find params[:id]
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end