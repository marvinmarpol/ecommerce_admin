class Product < ApplicationRecord
  belongs_to :seller
  belongs_to :category

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }


  def self.ransackable_associations(auth_object = nil)
    %w[category seller]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "category_id", "created_at", "description", "id", "name", "price", "published_at", "seller_id", "stock", "updated_at" ]
  end
end
