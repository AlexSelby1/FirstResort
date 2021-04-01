class StaticPagesController < ApplicationController
  # GET home page
  def home
    @categories = Category.all
  end

  # GET categories
  def category
    @categories = Category.all
    catName=params[:title]
    @jobs = Job.where("category like?", catName).order("created_at desc").page(params[:page]).per(3)
  end
end
