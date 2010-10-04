class Search
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :query

  def initialize(opts = {})
    opts.each do |k,v|
      send("#{k}=", v)
    end
  end

  def persisted?
    false
  end

  def results
    Package.search(self.query)
  end
end
