class Version < ActiveRecord::Base
  belongs_to :package

  def self.by_created_at
    order('created_at ASC')
  end

  def self.newest
    by_created_at.first
  end

  def self.build_from_prior
    if prior = last
      self.new(:min_sdk => prior.min_sdk, :license => prior.license, :license_url => prior.license_url)
    else
      self.new
    end
  end

  def date
    created_at
  end
end
