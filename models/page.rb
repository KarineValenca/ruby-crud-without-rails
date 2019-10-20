require './models/page_config'

class Page
    attr_accessor :id, :name, :slug, :config, :tags

    def initialize(id, name, slug, config)
        @id = id
        @name = name
        @slug = slug
        print config
        @config = PageConfig.new(config[:title], config[:description], config[:keywords])
        @tags = []
    end 
end