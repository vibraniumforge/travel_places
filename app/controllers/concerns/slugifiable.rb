module Slugifiable
binding.pry
  module InstanceMethods
    binding.pry
    def slug
      name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      binding.pry
    end
  end

  module ClassMethods
    binding.pry
    def find_by_slug(slug)
      self.all.find {|item| item.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') == slug }
      binding.pry
    end
  end
end
