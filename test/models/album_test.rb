# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer
#  band       :integer
#  studio     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
