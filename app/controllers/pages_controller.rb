class PagesController < ApplicationController

  def show
    @page = Page.includes(:widgets, :guides)
                .joins(:domain).where('domains.code = ?', current_domain)
                .friendly.find params[:id]
    add_breadcrumb @page.title
    @h1 = @page.title
  end

end
