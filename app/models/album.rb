# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer
#  band_id    :integer
#  studio     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  validates :band, null: false
  validates :year, :title, length: { minimum: 1 }, allow_nil: false

  belongs_to :band

  has_many :tracks,
    dependent: :destroy
end
