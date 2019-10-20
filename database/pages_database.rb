require 'mysql2'
require './database/config_database'

class PagesDatabase

    def self.create(page)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("INSERT INTO page (id, name, slug) VALUES (#{page.id}, '#{page.name}', '#{page.slug}')")
        connection.close
        ConfigDatabase.create(page)
    end

    def self.read(id)
        page = {}
        config = {}
        tags = []
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("SELECT * FROM page WHERE id = '#{id}'")
        config_results = connection.query("SELECT * from page_config where page_id = '#{id}'")
        tags_results = connection.query("SELECT * from pages_tags where page_id = '#{id}'")
        results.each do |row|
            page[:id] = row["id"].to_i
            page[:name] = row["name"]
            page[:slug] = row["slug"]
        end
        config_results.each do |row|
            config[:title] = row["title"]
            config[:description] = row["description"]
            config[:keywords] = row["keywords"]
        end
        tags_results.each do |row|
            tags << row["tag_id"]

        end
        connection.close
        page[:tags] = tags
        page[:config] = config
        page
    end

    def self.update(id, attr, value)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("UPDATE page SET #{attr} = '#{value}' WHERE id = #{id}")
        connection.close
    end

    def self.delete(id)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("DELETE FROM page WHERE id = '#{id}'")
        connection.close
        ConfigDatabase.delete(id)
    end

    def self.add_tag(page_id, tag_id)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("INSERT INTO pages_tags (page_id, tag_id) VALUES (#{page_id}, #{tag_id})")

        connection.close
    end
end