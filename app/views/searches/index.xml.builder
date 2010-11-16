xml.instruct!

xml.packages do
  @search.results.each do |package|
    xml.package do
      xml.name h(package.name)
      xml.url h(package.url)
      xml.description h(package.description)
      xml.maintainer do
        xml.name h(package.maintainer.name)
        xml.url h(package.maintainer.url)
        xml.openid_identifier h(package.maintainer.openid_identifier)
        xml.email h(package.maintainer.email)
        xml.organization do
          xml.name h(package.maintainer.organization.name)
          xml.url h(package.maintainer.organization.url)
        end
      end

      xml.versions do
        package.versions.by_created_at.each do |version|
          xml.version do
            xml.number h(version.number)
            xml.license_url h(version.license_url)
            xml.license h(version.license)
            xml.min_sdk h(version.min_sdk)
            xml.created_at h(version.created_at)
            xml.jar "http://#{HOST}#{version.jar.url}"
          end
        end
      end
    end
  end
end
