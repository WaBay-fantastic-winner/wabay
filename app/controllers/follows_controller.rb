# frozen_string_literal: true

class FollowsController < ApplicationController
  def index
    @follows = Follow.where(user_id: current_user.id, followable_type: 'Project')
  end
end
