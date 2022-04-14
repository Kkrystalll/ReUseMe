class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(params_resume)
    
    if @resume.save
      redirect_to resumes_path, notice: "新增成功"
    else
      render :new
    end
  end
  private
  def params_resume
    params.require(:resume).permit(:title, :content, :status)
  end

end
