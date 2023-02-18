class WebhookAction < ApplicationRecord
  has_many :builds, dependent: :destroy
end
