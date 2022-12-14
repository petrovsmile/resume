# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id          :bigint           not null, primary key
#  caption     :string
#  object_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  object_id   :bigint
#
# Indexes
#
#  index_images_on_object  (object_type,object_id)
#
class Image < ApplicationRecord
  belongs_to :object, polymorphic: true

  has_one_attached :src do |attachable|
    attachable.variant :thumb, resize_to_limit: [400, 200]
    attachable.variant :detail, resize_to_limit: [1200, 1200]
  end
end
