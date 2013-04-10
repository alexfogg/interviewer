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
#  customer_id     :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :image, :balance, :address, :phone, :is_house, :lat, :lng
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

  def text_result(user, progress)
    interview = progress.interview
    a = (interview.passing)/(interview.passing + interview.failing)
    client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    if progress.passing
      client.account.sms.messages.create(:from => '+17329630742', :to => '+17324039102', :body => "Congrats #{user.name.titleize}, you have passed #{progress.interview.name} with a #{progress.percentage}%. The passing rate on this exam was #{a}%" )
    else
      client.account.sms.messages.create(:from => '+17329630742', :to => '+17324039102', :body => "Sorry #{user.name.titleize}, you have failed #{progress.interview.name} with a #{progress.percentage}%. The passing rate on this exam was #{a}%. May god have mercy on your poor soul." )
    end
  end

end
