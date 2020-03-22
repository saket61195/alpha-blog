class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def index
        @articles = Article.all
    end
    def show
        @article= Article.find(params[:id])
    end


    def edit
        @article = Article.find(params[:id])
    end

    def create
        # render plain: params[:article].inspect    # to display plain text on browser
        @article = Article.new(article_params)
        if @article.save 
            flash[:notice] ="Article sucessfull created"
        redirect_to article_path(@article)  # redirect_to @article
        else
            render 'new'

        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] ="Article sucessfull updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end

    end

    def destroy
        @article = Article.find(params[:id])
   if @article.destroy
    flash[:notice] ="Article sucessfull deleted"
 
    redirect_to articles_path
   end
    end




    private
    def article_params
        params.require(:article).permit(:title,:description)

    end
end
