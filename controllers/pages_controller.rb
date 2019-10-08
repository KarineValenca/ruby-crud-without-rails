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
            
            print "Encontrado página:\nNome: #{page.name}\nSlug: #{page.slug}\nConfiguração:\n"
            print "Título: #{page.config.title}\nDescrição: #{page.config.description}\n"
            print "Palavras-chave: #{page.config.keywords}\nTags:\n" 
            page.tags.each do |tag|
                puts "    #{tag.name}"
            end
            page
        else
            print "Não foi possível encontrar a página\n"
        end
    end

    def self.update(id, attribute, value)
        valid_attributes = ["name", "slug", "config.title", "config.description", "config.keywords"]
        
        if valid_attributes.include? attribute
        
            page = read(id)
            if page != nil
                if attribute.include? "config."
                    attribute.slice! "config."
                    page.config.instance_variable_set("@#{attribute}", value)
                else
                    page.instance_variable_set("@#{attribute}", value)
                end
                print "\n Atualizado pagina\n"
                print "Nome: #{page.name}\nSlug: #{page.slug}\nConfiguração:\n"
                print "Título: #{page.config.title}\nDescrição: #{page.config.description}\n"
                print "Palavras-chave: #{page.config.keywords}\nTags:\n"
                page
            end
        else
            print "Atributo inválido, os atributos válidos são:\n"
            print "name, slug, config.title, config.description, config.keywords\n"
        end
        
    end

    def self.delete(id)
        page_list_updated = FakeDb.list_pages.reject! { |page| page.id == id }
        print "deletada página"
        page_list_updated
    end

    def self.add_tag(page_id, tag_id)
        page = read(page_id)
        if page != nil
            tag = TagsController.read(tag_id)
                if tag != nil
                    page.tags << tag
                end
        end
        page
    end
end