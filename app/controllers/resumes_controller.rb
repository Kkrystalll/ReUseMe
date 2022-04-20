class ResumesController < ApplicationController
  before_action :find_resume, only: [:show]
  before_action :find_my_resume, only: [:edit, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]

  def index
    flash[:notice] = "11111"
    @resumes = Resume.published
  end

  def my
    @resumes = current_user.resumes
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = current_user.resumes.new(params_resume)
    
    if @resume.save
      redirect_to my_resumes_path, notice: "新增成功"
    else
      render :new, notice: "error"
    end
  end

  def show
    
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])

    if @resume.update(params_resume)
      redirect_to my_resumes_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume = current_user.resumes

    @resume.destroy
    redirect_to root_path, notice: "刪除成功"
  end


  private
  def params_resume
    params.require(:resume).permit(:title, :content, :status)
  end


  def find_resume
    if user_sign_in?
      find_my_resume
    else
      @resume = Resume.published.find(params[:id])
    end
  end

  def find_my_resume
    @resume = current_user.resumes.find(params[:id])
  end
end
