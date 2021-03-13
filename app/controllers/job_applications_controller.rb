class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [:index, :show, :search]

  # GET /job_applications or /job_applications.json
  def index
    @job_applications = JobApplication.order("created_at desc").page(params[:page]).per(3)
    @categories = Category.all
  end

  # GET /job_applications/1 or /job_applications/1.json
  def show
    @job_application = JobApplication.find(params[:id])
  end

  # GET /job_applications/new
  def new
    @job_application = current_user.job_applications.new
  end

  # GET /job_applications/1/edit
  def edit
  end

  # POST /job_applications or /job_applications.json
  def create
    @job_application = current_user.job_applications.new(job_application_params)
    @job_application.user_id = current_user.id
    
    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job_application, notice: "Job application was successfully created." }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_applications/1 or /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to @job_application, notice: "Job application was successfully updated." }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1 or /job_applications/1.json
  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: "Job application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

   # SEARCH
   def search
    st = "%#{params[:q]}%"
    ct = "%#{params[:c]}%"
    if params[:c] == ''
     @job_applications = JobApplication.where("lower(title) like ? OR lower(description) like ? AND lower(country) like ?", st.downcase, st.downcase, nil).order("created_at desc").page(params[:page]).per(3)
    elsif params[:q] == ''
      @job_applications = JobApplication.where("lower(country) like ?", ct.downcase).order("created_at desc").page(params[:page]).per(3)
    else
      @job_applications = JobApplication.where("lower(title) like ? OR lower(description) like ?", st.downcase, st.downcase).where("lower(country) like ?", ct.downcase).order("created_at desc").page(params[:page]).per(3)
    end
    @categories = Category.all
   end

  # CATEGORY  
  def category
    catName=params[:title]
    @job_applications = JobApplication.where("category LIKE?", catName).order("created_at desc").page(params[:page]).per(3)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_applications = JobApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_application_params
      params.require(:job_application).permit(:id, :title, :country, :cat, :description, :images, :user_id)
    end
end
