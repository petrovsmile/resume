# == Schema Information
#
# Table name: images
#
#  id          :bigint           not null, primary key
#  object_type :string
#  object_id   :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Image < ApplicationRecord
  belongs_to :object, polymorphic: true

  has_one_attached :src do |attachable|
    attachable.variant :thumb, resize_to_limit: [400, 300]
    attachable.variant :detail, resize_to_limit: [1200, 1200]
  end
end
