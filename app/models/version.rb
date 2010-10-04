class Version < ActiveRecord::Base
  belongs_to :package

  def self.by_created_at
    order('created_at ASC')
  end

  def self.newest
    by_created_at.first
  end

  def date
    created_at
  end
end
