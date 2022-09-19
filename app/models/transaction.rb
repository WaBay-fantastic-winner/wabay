# frozen_string_literal: true

class Transaction < ApplicationRecord
  acts_as_paranoid
  default_scope { where(deleted_at: nil) }

  # relationship
  belongs_to :user
  belongs_to :donate_item

  before_create :create_serial

  def create_serial
    self.serial = SecureRandom.alphanumeric(6)
  end

  # pessimistic lock
  def self.can_buy?(project_id, donate_item_title, amount)
    donate_item = DonateItem.find_by!(project_id: project_id, title: donate_item_title)
    if donate_item.amount === nil
      true
    else
      donate_item.with_lock do
        if donate_item.amount > 0 && amount.to_i <= donate_item.amount
          donate_item.decrement(:amount, amount.to_i)
          donate_item.save
          true 
        else
          false
        end
      end
    end
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
end
