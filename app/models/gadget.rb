class Gadget < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  has_many :photos
  accepts_nested_attributes_for :photos

  def self.search(name)
    return [] if name.blank?
    where("name like '%#{name}%'")
  end
end
