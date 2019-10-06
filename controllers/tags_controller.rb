require './models/tag'

class TagsController
    def self.create(id, name)
        print "criado tag com o nome #{name}\n"
        Tag.new(id, name)
    end

    def self.read(tag_list, id)
        tag = tag_list.find { |tag| tag.id == id }
        if tag != nil
            print "encontrado tag: nome: #{tag.name}\n"
            tag
        else
            print "não foi possivel encontrar tag\n"
        end
    end

    def self.update(tag_list, id, attr, value)
        tag = read(tag_list, id)
        if tag != nil
            tag.instance_variable_set("@#{attr}", value)
            print "atualizado tag: nome: #{tag.name}\n"
            tag
        end
    end

    def self.delete(tag_list, id)
        tag_list_updated = tag_list.reject { |tag| tag.id == id }
        print tag_list_updated
    end
end