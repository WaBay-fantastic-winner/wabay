module Follow
  class Project 
    def initialize(user)
      @follower = [] unless defined? @follower
    end

    def notify_follower
      @follower.each do 

      end
    end
  end

  class Follower
    def update

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

