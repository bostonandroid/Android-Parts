class Maintainer < ActiveRecord::Base
  belongs_to :organization
  has_many :packages

  validates_presence_of :organization_id, :if => :complete?

  def complete?
    name.present? && email.present?
  end
end
