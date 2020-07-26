# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  bonus      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Track < ApplicationRecord
  validates :album_id, :title, :ord, :bonus, null: false

  belongs_to :album

  has_many :notes,
    class_name: :Note,
    foreign_key: :track_id,
    dependent: :destroy
end
