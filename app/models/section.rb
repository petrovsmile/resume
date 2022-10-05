# frozen_string_literal: true

# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Section < ApplicationRecord
  has_rich_text :content
end
