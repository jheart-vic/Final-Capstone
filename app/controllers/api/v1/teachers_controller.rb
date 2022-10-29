class Api::V1::TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
    render json: @teachers
  end

  def show
    @teacher = Teacher.find(params[:id])
    render json: @teacher
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      render json: @teacher, status: :created, data: @teacher
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  def update
    if @teacher.update(teacher_params)
      render json: @teacher
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @teacher.destroy
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :title, :photo)
  end
end
