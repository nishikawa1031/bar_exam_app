class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

    # app/views/リソース名/アクション名.html.erb
    # app/views/static_pages/home.html.erb
  end

  # GET /static_pages/:name
  def show
    @subject = params[:name]    #カラムのsubjectとは、無関係のsubjectだから注意。
    @year = params[:year_id]
    if @year.nil?
      @microposts = Micropost.where(subject: params[:name])
    else
      @microposts = Micropost.where(subject: params[:name],year: params[:year_id])
    end
  end



  def help
  end

  def about
    # 'app/views/static_pages/about.html.erb'
  end

  def contact
    # app/views/static_pages/contact.html.erb'
  end
end
