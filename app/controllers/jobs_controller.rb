class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [:index, :show, :search]
  include UserHelper, JobApplicationHelper

  # GET /jobs or /jobs.json
  def index
    @jobs = Job.order("created_at asc").page(params[:page]).per(4)
    @categories = Category.all
  end

  # GET /jobs/1 or /jobs/1.json
  def show
    @job = Job.find(params[:id])
  end

  # GET /jobs/new
  def new
    @job = current_user.jobs.new
  end

  # GET /jobs/1/edit
  def edit
  #  @job = Job.find(params[:id])
  end

  # POST /jobs or /jobs.json
  def create
    @job= current_user.jobs.new(job_params)
    @job.user_id = current_user.id
    
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: "Job  was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: "Job  was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully deleted." }
      format.json { head :no_content }
    end
  end

   # SEARCH
   def search
    st = "%#{params[:q]}%"
    ct = "%#{params[:c]}%"
    if params[:c] == ''
     @jobs = Job.where("lower(title) like ? OR lower(description) like ? AND lower(country) like ?", st.downcase, st.downcase, nil).order("created_at desc").page(params[:page]).per(3)
    elsif params[:q] == ''
      @jobs = Job.where("lower(country) like ?", ct.downcase).order("created_at desc").page(params[:page]).per(3)
    else
      @jobs = Job.where("lower(title) like ? OR lower(description) like ?", st.downcase, st.downcase).where("lower(country) like ?", ct.downcase).order("created_at desc").page(params[:page]).per(3)
    end
    @categories = Category.all
   end

  # CATEGORY  
  def category
    catName=params[:title]
    @jobs = Job.where("category LIKE?", catName).order("created_at desc").page(params[:page]).per(4)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :country, :category, :description, :images, :user_id)
    end
end
