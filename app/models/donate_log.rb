# frozen_string_literal: true

class DonateLog < ApplicationRecord
  belongs_to :donate_item, counter_cache: true
end
