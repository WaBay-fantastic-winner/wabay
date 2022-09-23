# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :find_question, only: %i[edit update destroy]
  before_action :find_project_by_question, only: %i[edit update destroy]
  before_action :find_project, only: %i[index new create]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = @project.questions.new(params_question)
    if @question.save
      redirect_to project_questions_path(@project.id), notice: '常見問題建立成功'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(params_question)
      redirect_to project_questions_path(@project.id), notice: '常見問題更新成功'
    else
      render :edit, notice: '常見問題更新失敗'
    end
  end

  def destroy
    @question.destroy
    redirect_to project_questions_path(@project.id), notice: '常見問題刪除成功'
  end

  private

  def params_question
    params.require(:question).permit(:title, :content)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def current_project
    @current_project = current_user.projects.find(params[:project_id])
  end

  def find_project_by_question
    @project = Question.find(params[:id]).project
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
