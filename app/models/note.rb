# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  track_id   :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Note < ApplicationRecord
end
