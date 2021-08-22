class ForzaController < ApplicationController

  def home
    # article.参照
    @articles = Article.limit(3).order(created_at: :desc)

    gon.google_calender_API_key = ENV['GOOGLE_CALENDER_API_KEY']
    gon.calender_id_1 = ENV['CALENDER_ID_1']
    gon.calender_id_2 = ENV['CALENDER_ID_2'] 


  end

  def about
  end

  def news
  end

  def contact
  end


end
