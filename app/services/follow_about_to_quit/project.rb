# frozen_string_literal: true

module Follow
  class Project
    # 專案建立後呼叫，產生空白名單
    def initialize
      @follower = [] unless defined? @follower
    end

    def add_follower
      @follower << current_user.id
    end

    # 狀態更新後，通知所有的追蹤者。
    def notify_follower
      @follower.each(&:update)
    end

    def update(notification)
      puts notification.to_s
    end

    # 胃給追蹤者的狀態與消息
    def almost_end
      update('您追蹤的專案即將結束募資，還在猶豫是否募資嗎？趕快把握最後機會～') if Project.where <= 7
    end
  end
end

# 設計流程：
# 在畫面按下 link，打 API 到 projects#follow。
# 在 projects#follow 呼叫 Follow::Project.new，把使用者加入訂閱者清單內。
# 回傳參數( Follow model 的 follow 狀態： followed/unfollow )，讓追蹤與否呈現不同效果。

# model Follow follow:string user:belongs_to project:belongs_to
# follow 欄位：follow /no_follow (aasm)

# ProjectController 要加一個 follow (get)

# 針對什麼狀態的變動進行通知？？？？
