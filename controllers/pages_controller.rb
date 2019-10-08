require './models/page'
require './controllers/tags_controller'
require './fake_db'

class PagesController
    def self.create(id, name, slug, title, description, keywords)
        config = {
            title: title, 
            description: description, 
            keywords: keywords
        }

        page = Page.new(id, name, slug, config)
        FakeDb.add_pages(page)

        print "criado página: Nome: #{page.name} Slug: #{page.slug}
                Configuração:
                Título: #{page.config.title}
                Descrição: #{page.config.description}
                Palavras-chave: #{page.config.keywords}\n"
        page
    end

    def self.read(id)
        page = FakeDb.list_pages.find { |page| page.id == id }
        if page != nil
            print "encontrado página: nome: #{page.name} slug: #{page.slug}
                    Configuração:
                    Título: #{page.config.title}
                    Descrição: #{page.config.description}
                    Palavras-chave: #{page.config.keywords}
                    Tags: #{page.tags}\n"
            page
        else
            print "Não foi possível encontrar a página\n"
        end
    end

    def self.update(id, attribute, value)
        page = read(id)
        if page != nil
            page.instance_variable_set("@#{attribute}", value)
            print "atualizado pagina: nome: #{page.name} slug: #{page.slug}\n"
            page
        end
    end

    def self.delete(id)
        page_list_updated = FakeDb.list_pages.reject! { |page| page.id == id }
        print page_list_updated
        page_list_updated
    end

    def self.add_tag(page_id, tag_id)
        page = read(page_id)
        if page != nil
            tag = TagsController.read(tag_id)
                if tag != nil
                    page.tags << tag
                    print page.tags
                end
        end
        page
    end
end