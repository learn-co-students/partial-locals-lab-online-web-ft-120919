class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def index
    if params[:query]
      @students = Student.search(params[:query])
    else
      @students = Student.all
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  # def search
  #   #binding.pry
  #   @
  #   #How do we pass @students to index action?
  #   #Or maybe params should get passed right to index action?
  #   #Can one action have both a 'post' and a 'get'?
  # end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
