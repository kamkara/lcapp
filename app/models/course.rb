class Course < ApplicationRecord
  belongs_to :user
  belongs_to :level
  belongs_to :material
  validates :title,
            :content,
            :user_id,
            :material_id,
            :level_id,
            :slug, presence: true
 
  validates :title, length: { minimum:20 }
  validates :content, length: { minimum:50 }

  
  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
