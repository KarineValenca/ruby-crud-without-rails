require './models/page'

class PagesController

    def self.create(id, name, slug, title, description, keywords)
        config = [title, description, keywords]
        print "criado página com o nome #{name} e com o slug #{slug}\n"
        Page.new(id, name, slug, config)
    end

    def self.read(page_list, id)
        page = page_list.find { |page| page.id == id }
        print "encontrado página: nome: #{page.name} slug: #{page.slug}"
        page
    end

    #TODO não funciona ainda
    def self.update(page_list, id, attr, value)
        page = page_list.find { |page| page.id == id }
        page.instance_variable_set(:@attr, value)
        print page.name
    end

    def self.delete(page_list, id)
        page_list_updated = page_list.reject { |page| page.id == id }
        print page_list_updated
    end

end