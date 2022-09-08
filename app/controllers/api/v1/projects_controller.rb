class Api::V1::ProjectsController < ApplicationController

  def progress_bar
    @projects = Project.all
    @projects.each do |projects| 
      project.current_total / project
  end
end
