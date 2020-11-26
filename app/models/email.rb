# frozen_string_literal: true

class Email < ApplicationRecord

  validates :sender_name, presence: true, length: { maximum: 100 }
  validates :sender_email, length: { maximum: 100 }
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }


  before_create { self.send_time = Time.now }


end
