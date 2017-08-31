class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :dish_category
  has_attached_file :image,
                    styles: { large: '800x400>', medium: '400x200>' },
                    default_url: '/images/:style/missing.png',
                    storage: :s3,
                    s3_credentials: {
                        bucket: ENV['AWS_BUCKET'],
                        access_key_id: ENV['AWS_ACCESS_KEY'],
                        secret_access_key: ENV['AWS_SECRET_KEY'],
                        s3_region: ENV['AWS_REGION'],
                        url: :s3_domain_url,
                        s3_host_name: "s3-#{ENV['AWS_REGION']}.amazonaws.com"
                    }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
