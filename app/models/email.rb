# frozen_string_literal: true

class Email < ApplicationRecord

  validates :sender_name, absence: true, length: { maximum: 100 }
  validates :sender_email, length: { maximum: 100 }, format: { with: /[a-zA-Z0-9_-]+/, message: 'only allows valid email'}
  validates :title, absence: true, length: { maximum: 100 }
  validates :content, absence: true, length: { maximum: 1000 }


  before_create { self.send_time = Time.now }


end
