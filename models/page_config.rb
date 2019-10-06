class PageConfig
    attr_accessor :title, :description, :keywords

    def initialize(title, description, keywords)
        @title = title
        @description = description
        @keywords = keywords
    end 
end