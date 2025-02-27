class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :microposts, dependent: :destroy
  has_one_attached :avatar
  has_many :user_tags, dependent: :destroy
  has_many :tags, through: :user_tags

  scope :by_name, ->(name) { where('name LIKE ?', "%#{name}%") }
  scope :by_tag, ->(tag_ids) { joins(:user_tags).where(user_tags: { tag_id: tag_ids }) }

  def save_with_tags!(tag_names:)
    return save! if tag_names.nil? # blank?だと削除ができない

    ActiveRecord::Base.transaction do
      self.tags = tag_names.map { |name| Tag.find_or_initialize_by(name:) }
      save!
    end
    true
  rescue StandardError
    false
  end
end
