require './models/page'
require './controllers/tags_controller'
require './database/pages_database'

class PagesController
    def self.create(id, name, slug, title, description, keywords)
        config = {
            title: title, 
            description: description, 
            keywords: keywords
        }

        page = Page.new(id, name, slug, config)

        PagesDatabase.create(page)

        print "criado página: Nome: #{page.name} Slug: #{page.slug}
                Configuração:
                Título: #{page.config.title}
                Descrição: #{page.config.description}
                Palavras-chave: #{page.config.keywords}\n"
        page
    end

    def self.read(id)    
        page = PagesDatabase.read(id)
        #TODO Correct verification
        if page.any?
            print "Encontrado página:\nNome: #{page[:name]}\nSlug: #{page[:slug]}\nConfiguração:\n"
            print "Título: #{page[:config][:title]}\nDescrição: #{page[:config][:description]}\n"
            print "Palavras-chave: #{page[:config][:keywords]}\nTags:\n"
            if page[:tags] != nil
                page[:tags].each do |tag|
                    TagsController.read(tag)
                end
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
                    ConfigDatabase.update(id, attribute, value)
                else
                    PagesDatabase.update(id, attribute, value)
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
        PagesDatabase.delete(id)
        print "deletada página"
    end

    def self.add_tag(page_id, tag_id)
        page = read(page_id)
        if page != nil
            tag = TagsController.read(tag_id)
                if tag != nil
                    PagesDatabase.add_tag(page_id, tag_id)
                end
        end
        page
    end
end