# frozen_string_literal: true

class Transaction < ApplicationRecord
  # relationship
  belongs_to :user
  belongs_to :donate_item

  # create serial
  before_create :create_serial

  def create_serial
    self.serial = SecureRandom.alphanumeric(6)
  end

  # transaction state
  include AASM

  aasm column: 'state', no_direct_assignment: true do
    state :pending, initial: true
    state :paid, :failed, :cancellation, :refunded

    event :pay do
      transitions from: %i[pending failed], to: :paid
    end

    event :refund do
      transitions from: :paid, to: :refunded
    end

    event :fail do
      transitions from: :pending, to: :failed
    end

    event :cancel do
      transitions from: %i[pending failed], to: :cancellation
    end
  end

  # 軟刪除
  acts_as_paranoid
  default_scope { where(deleted_at: nil) }
end
