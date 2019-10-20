class ConfigDatabase

    def self.create(page)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("INSERT INTO page_config (title, description, keywords, page_id) VALUES ('#{page.config.title}', '#{page.config.description}', '#{page.config.keywords}', #{page.id})")
        connection.close
    end

    def self.update(id, attribute, value)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("UPDATE page_config SET #{attribute} = '#{value}' WHERE page_id = #{id}")
        connection.close
    end

    def self.delete(id)
        connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "crud")
        results = connection.query("DELETE FROM page_config WHERE page_id = '#{id}'")
        connection.close
    end
    
end