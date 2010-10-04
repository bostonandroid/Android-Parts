class Organization < ActiveRecord::Base
  has_many :maintainers
end
