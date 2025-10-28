class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :update, :destroy]
  before_action :authenticate_request, except: [:create]

  # GET /teachers
  def index
    render json: Teacher.all
  end

  # GET /teachers/:id
  def show
    render json: @teacher
  end

  # POST /teachers
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      render json: @teacher, status: :created
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # PUT /teachers/:id
  # PATCH /teachers/:id
  def update
    if @teacher.update(teacher_params)
      render json: @teacher
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/:id
  def destroy
    @teacher.destroy
    head :no_content
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
  params.require(:teacher).permit(:name, :email, :password, :password_confirmation, :department_id)
  end
end
