# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  code       :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Section < ApplicationRecord
  def self.get_content(code)
    section = Section.find_by(code: code)
    section.present? ? section.content : nil
  end
end
