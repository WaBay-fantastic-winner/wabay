class Transaction < ApplicationRecord
  # relationship
  belongs_to :user
  belongs_to :donate_item

  # create serial
  before_create :create_serial

  def create_serial
    time = Time.now.strftime('%d%m%Y%H%M%S').split('').uniq.sample(3)
    words = ("a".."z").to_a.sample(3)
    self.serial = (time + words).join
  end

  # transaction state
  include AASM

  aasm column: "state", no_direct_assignment: true do
    state :pending, initial: true
    state :paid, :failed, :cancellation, :refunded

    event :pay do
      transitions from: [:pending, :failed], to: :paid
    end

    event :refund do
      transitions from: :paid, to: :refunded
    end

    event :fail do
      transitions from: :pending, to: :failed
    end

    event :cancel do
      transitions from: [:pending, :failed], to: :cancellation
    end
  end

  # 軟刪除 
  acts_as_paranoid
  default_scope { where(deleted_at: nil) }
end
