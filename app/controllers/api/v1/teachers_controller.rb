class Api::V1::TeachersController < ApplicationController
  before_action :set_teacher, only: %i[show update destroy]
  def index
    @teachers = Teacher.all
    render json: @teachers
  end

  def show
    render json: @teacher
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.photo = 'https://img.icons8.com/ios-glyphs/344/person-male.png' if @teacher.photo.empty?
    if @teacher.save
      render json: @teacher, status: :created, data: @teacher
    else
      render json: { data: @teacher.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end
  end

  def update
    if @teacher.update(teacher_params)
      render json: { data: @teacher, mesage: 'Updated Teacher Successfully', status: :ok }
    else
      render json: { data: 'Successfully went wrong', status: 'failed' }
    end
  end

  def destroy
    if @teacher.destroy
      render json: { data: 'Deleted Teacher Successfully', status: :ok }
    else
      render json: { data: 'Successfully went wrong', status: 'failed' }
    end
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :title, :photo)
  end
end
