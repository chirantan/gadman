class Gadget < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true

  def self.search(name)
    return [] if name.blank?
    where("name like '%#{name}%'")
  end
end
