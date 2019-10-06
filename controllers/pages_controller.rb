require './models/page'
require './controllers/tags_controller'

class PagesController

    def self.create(id, name, slug, title, description, keywords)
        config = {
            title: title, 
            description: description, 
            keywords: keywords
        }
        print "criado página: nome: #{name} slug: #{slug}\n"
        Page.new(id, name, slug, config)
    end

    def self.read(page_list, id)
        page = page_list.find { |page| page.id == id }
        if page != nil
            print "encontrado página: nome: #{page.name} slug: #{page.slug}\n"
            page
        else
            print "Não foi possível encontrar a página\n"
        end
    end

    def self.update(page_list, id, attr, value)
        page = read(page_list, id)
        if page != nil
            page.instance_variable_set("@#{attr}", value)
            print "atualizado pagina: nome: #{page.name} slug: #{page.slug}\n"
            page
        end
    end

    def self.delete(page_list, id)
        page_list_updated = page_list.reject { |page| page.id == id }
        print page_list_updated
    end

    def self.add_tag(page_list, page_id, tag_list, tag_id)
        tag = TagsController.read(tag_list, tag_id)
        page = read(page_list, page_id)
        page.tags << tag
        print page.tags
    end
end