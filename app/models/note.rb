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
  validates :author_id, :track_id, :body, null: false

  belongs_to :author,
    class_name: :User

  belongs_to :track
end
