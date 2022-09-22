# == Schema Information
#
# Table name: joysticks
#
#  id         :bigint           not null, primary key
#  hash_code  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Joystick < ApplicationRecord
end
