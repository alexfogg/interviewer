# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :interviews

  def self.make_tags(tags)
    tags.split(',').map do |tag|
      tag =  tag.squish
      t = Tag.where(name: tag).first
      t = Tag.create(name: tag) if t.nil?
      t
    end
  end





end
