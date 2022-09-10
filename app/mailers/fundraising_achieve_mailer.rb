class FundraisingAchieveMailer < ApplicationMailer
  def notify(project)
    @greeting = "#{project}的募資金額已經達成囉！非常感謝您付出的力量！讓我們一起來看看 #{project}後續的進度吧！"
    mail to: "wl02599509@gmail.com", subject: "#{project}募資資金已達標！"
  end
end
