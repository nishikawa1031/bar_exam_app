class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: { if: 'picture.nil?'},
                      length: { maximum: 10000 }
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
    bankruptcy_law:7,
    tax_law:8,
    economic_law:9,
    intellectual_property_law:10,
    labor_law:11,
    environmental_law:12,
    international_private_law:13,
    international_public_law:14,
}



  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 1.megabytes
        errors.add(:picture, "should be less than 1MB")
      end
    end
end
