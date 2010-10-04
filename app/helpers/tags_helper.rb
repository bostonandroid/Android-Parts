module TagsHelper
  def link_tags(tags)
    tags.map do |tag|
      link_to(tag.name, searches_path(:search => {:query => tag.name}))
    end.join(', ').html_safe
  end
end
