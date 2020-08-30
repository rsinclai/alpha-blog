class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
  end
  
  def new
	@article = Article.new # needed to avoid  error displaying messages on initial screen load
  end
 
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    #@article.save
    #redirect_to article_path(@article)
	if @article.save
      flash[:notice] = "The article has been created successfully."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end  

end