class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true,
                      length: { maximum: 140 }
  validate  :picture_size
  validates  :subject, presence: true
  validates  :year, presence: true
  
  
  enum subject:{
    constitution: 0,
    civil_law:1,
    criminal_law:2,
    civil_procedure_law:3,
    criminal_procedure_law:4,
    administrative_law:5,
    commercial_law:6,
}

  def to_param
    subject
  end

  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 1.megabytes
        errors.add(:picture, "should be less than 1MB")
      end
    end
end
