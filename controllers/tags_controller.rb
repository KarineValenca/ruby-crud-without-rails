require './models/tag'
require './fake_db'

class TagsController
    def self.create(id, name)
        tag = Tag.new(id, name)
        print "criado tag com o nome #{tag.name}\n"
        FakeDb.add_tags(tag)
        tag
    end

    def self.read(id)
        tag = FakeDb.list_tags.find { |tag| tag.id == id }
        if tag != nil
            print "encontrado tag: nome: #{tag.name}\n"
            tag
        else
            print "não foi possivel encontrar tag\n"
        end
    end

    def self.update(id, attr, value)
        tag = read(id)
        if tag != nil
            tag.instance_variable_set("@#{attr}", value)
            print "atualizado tag: nome: #{tag.name}\n"
            tag
        end
    end

    def self.delete(id)
        tag_list_updated = FakeDb.list_tags.reject! { |tag| tag.id == id }
        #print tag_list_updated
        tag_list_updated
    end
end