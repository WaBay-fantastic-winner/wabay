# frozen_string_literal: true

class FundraisingAchieveMailer < ApplicationMailer
  def notify(follower, project_title)
    @greeting = "#{project_title}的募資金額已經達成囉！非常感謝您付出的力量！讓我們一起來看看 #{project_title}後續的進度吧！"
    mail to: "#{User.find(follower.user_id).email}", subject: "#{project_title}募資資金已達標！"
  end
end
