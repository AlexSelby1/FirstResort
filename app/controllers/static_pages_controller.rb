class StaticPagesController < ApplicationController
  
  def home
    @categories = Category.all
  end

def category
  @categories = Category.all
  catName=params[:title]
  @jobs = Job.where("category like?", catName).order("created_at desc").page(params[:page]).per(3)
end
end
