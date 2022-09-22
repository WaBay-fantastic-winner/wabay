# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @projects = Project.where("current_total < amount_target").where("end_time > ?", Time.current).order('random()').first(9)
    @success_projects = Project.where("current_total >= amount_target").order('random()').first(3)
  end
end
