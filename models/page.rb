require './models/page_config'

class Page
    attr_accessor :id, :name, :slug, :config

    def initialize(id, name, slug, config)
        @id = id
        @name = name
        @slug = slug
        @config = PageConfig.new(config[:title], config[:description], config[:keywords])
    end 
end