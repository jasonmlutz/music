# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  regular    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Track < ApplicationRecord
  validates :album_id, :title, :ord, :regular, null: false

  belongs_to :album
end
