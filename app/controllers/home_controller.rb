# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @projects = Project.all
  end
end
