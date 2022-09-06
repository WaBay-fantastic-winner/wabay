class DisclosuresController < ApplicationController
  before_action :find_project

  def show
    
  end

  private

  def find_project
    @project = Project.find_by(id: params[:project_id])
  end
end
