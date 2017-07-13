# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  summary    :text
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :summary, :body, presence: true
end
