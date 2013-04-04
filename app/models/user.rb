# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  name            :string(255)
#  password_digest :string(255)
#  image           :text
#  address         :text
#  phone           :string(255)
#  lat             :float
#  lng             :float
#  balance         :decimal(, )      default(0.0)
#  is_house        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :image, :remote_image_url, :balance, :address, :phone, :is_house
  mount_uploader :image, PicUploader
  has_secure_password
  has_many :interviews
  has_many :progresses
  geocoded_by :address

  before_save:geocode
  def geocode
    result = Geocoder.search(self.address).first

    if result.present?
      self.lat = result.latitude
      self.lng = result.longitude
    end
  end
end
