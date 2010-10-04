class Package < ActiveRecord::Base
  belongs_to :maintainer
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  has_many :versions

  accepts_nested_attributes_for :versions

  validates_presence_of :maintainer_id

  delegate :number, :date, :to => :newest_version, :prefix => true
  delegate :license, :license_url, :to => :newest_version

  ### TODO: maintainer, org, license
  def self.search(query)
    select('packages.*').
      where(<<-HERE, :query => query.downcase)
        lower(packages.name) = :query
        OR :query IN (
          SELECT lower(tags.name) FROM tags
          JOIN taggings ON taggings.taggable_id = packages.id
          AND taggings.taggable_type = 'Package'
        )
      HERE
  end

  def maintainer_name
    maintainer.name
  end

  def organization_name
    maintainer.organization.name
  end

  def newest_version
    versions.newest
  end
end
