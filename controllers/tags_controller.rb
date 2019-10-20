require './models/tag'
require './fake_db'
require './database/tags_database'

class TagsController
    def self.create(id, name)
        tag = Tag.new(id, name)
        print "criado tag com o nome #{tag.name}\n"
        TagsDatabase.create(tag)
        tag
    end

    def self.read(id)
        tag = TagsDatabase.read(id)
        if tag.any?
            print "encontrado tag: nome: #{tag[:name]}\n"
            tag
        else
            print "não foi possivel encontrar tag\n"
        end
    end

    def self.update(id, attr, value)
        tag = read(id)
        if tag != nil
            TagsDatabase.update(id, attr, value)
        end
    end

    def self.delete(id)
        tag = read(id)
        print tag
        if tag != nil
            TagsDatabase.delete(id)
        end
    end
end