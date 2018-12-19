class ArticlesController < ApplicationController
  before_action :get_categories
  before_action :get_widget

  def index
    @articles = Article.published.page(params[:page]).per(10)
    if params[:categorie]
      @category = Category.find_by_slug(params[:categorie])
      @articles = @articles
                      .joins(:domain).where('domains.code = ?', current_domain)
                      .joins(:categories).where('categories.slug = ?', params[:categorie])
      add_breadcrumb @category.title
      @h1 = @category.title
    else
      add_breadcrumb 'Actualités générales'
      @h1 = 'Actualités générales'
    end
  end

  def show
    @article = Article.find_by_slug(params[:id])
    add_breadcrumb 'Actualités générales', articles_path
    add_breadcrumb @article.title
    @h1 = @article.title
  end

  def get_categories
    @categories = Category.all
  end

  def get_widget
    @widget = Widget.joins(:domain).where('domains.code = ?', current_domain)
                  .find_by_title('A Propos')
  end

end
