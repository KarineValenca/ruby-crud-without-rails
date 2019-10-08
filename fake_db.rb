class FakeDb

    $page_list = []
    $tags_list = []
    def self.add_pages(page)
        $page_list << page
    end
    
    def self.list_pages
        $page_list
    end

    def self.add_tags(tag)
        $tags_list << tag
    end

    def self.list_tags
        $tags_list
    end
end