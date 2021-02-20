class StaticPagesController < ApplicationController
  
  def home
    @categories = Category.all
  end

def category
  catName=params[:title]
  @job_applications = JobApplication.where("category like?", catName).order("created_at desc").page(params[:page]).per(3)
end
end
